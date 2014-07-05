require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra'

set :public_folder, 'static'

get '/' do
  File.read(File.join('index.html'))
end

get '/api/' do

  #content_type :js
  content_type("application/javascript")
  response["Content-Type"] = "application/javascript"

  #require 'config/initializers/beamly.rb'
  root = ::File.dirname(__FILE__)
  require ::File.join( root, 'config', 'initializers', 'beamly' )
  #require 'config/initializers/beamly'

  z = Beamly::Epg.new
  region_id = z.regions.first.id
  provider_id = z.providers.first.id
  result = z.catalogues(region_id, provider_id)
  services = z.epg(result.first.epg_id)
  today = Date.today.strftime("%Y/%m/%d")
  schedule = z.schedule(services[8].service_id, today)

  today_formatted = Date.today.strftime("%Y-%m-%d")

  headers "Content-Type" => "application/json"

  json = '['
  schedule.each do |item|
    time_formatted = Time.at(item.start).getlocal.strftime("%Y-%m-%d %H:%M")
    json += '
      {
        "date": "'+time_formatted+'",
        "episodes":
        [
          {
          "show": {
            "title": "'+item.title+'",
            "year": 2013,
            "genres": ["Comedy"],

            },
          "episode":{"images": {"screen": "http://img-a.zeebox.com/940x505/'+item.img+'"}}

          }
        ]
      },
    '
  end
  json += ']'
  formatted_callback = "#{params['callback']}("+json+')'
  content_type("application/javascript")
  response["Content-Type"] = "application/javascript"
  formatted_callback
end
