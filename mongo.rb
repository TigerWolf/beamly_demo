require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra'

Mongoid.load!("mongoid.yml")

class Tvshow
  include Mongoid::Document
  field :name, type: String
  embeds_one :show
  embeds_one :episode
end

class Show
  include Mongoid::Document
  field :time, type: DateTime
  embedded_in :tvshow
end

class Episode
  include Mongoid::Document
  field :overview, type: String
  field :image, type: String
  embedded_in :tvshow
end

set :public_folder, 'static'

get '/' do
  File.read(File.join('index.html'))
end

get '/insert_data' do

  require 'config/initializers/zeebox.rb'

  z = Zeebox::Epg.new
  region_id = z.regions.first.id
  provider_id = z.providers.first.id
  result = z.catalogues(region_id, provider_id)
  services = z.epg(result.first.epg_id)
  today = Date.today.strftime("%Y/%m/%d")
  schedule = z.schedule(services[8].service_id, today)

  # Clear out existing data
  Tvshow.all.delete

  # Create new data from the api
  schedule.each do |tvshow|
    tv_show = Tvshow.new(name: tvshow.title)

    time = Time.at(tvshow.start).getlocal
    tv_show.show = Show.new(time: time)
    tv_show.episode = Episode.new(overview: tvshow.desc, image: tvshow.img)
    tv_show.save
  end

  "There were " + Tvshow.count.to_s + " TV shows added."

end

get '/api/' do

  headers "Content-Type" => "application/json"

  json = '['
  Tvshow.each do |item|
    
    json += '
      {
        "date": "'+item.show.time.strftime("%Y-%m-%d %H:%M")+'",
        "episodes": 
        [
          {
          "show": {
            "title": "'+item.name+'",
            "year": 2013,
            "genres": [""],
            },
          "episode":{
            "images": {"screen": "http://img-a.zeebox.com/940x505/'+item.episode.image+'"},
            "overview": "'+item.episode.overview+'"
          }

          }
        ]
      },
    '
  end
  json += ']'
  formatted_callback = "#{params['callback']}("+json+')'
end
