Zeebox Demo App
===============

This is a demo application using the zeebox gem. You can find that at http://github.com/TigerWolf/zeebox.

This is based off Serialgraphy which you can find here: https://github.com/sallar/serialgraphy

Instead of a php backend, this one uses sinatra and mongodb. Instead of Trakt it uses Zeebox api. 

Run the mongodb version with
```ruby mongo.rb```

Run the straight ruby version with
```ruby main.rb```

Origional Readme:

Serialgraphy
============

Tracking US TV Show Airtimes using [AngularJS](http://angularjs.org/) and CSS3.  
This app populates its data using [Trakt.tv](http://trakt.tv) API and filters unrelated genres out using PHP and then caches the result for easy access, and updates it every 6 hours.

## Online Version
This web app is online and working on it's website: [Serialgraphy.com](http://serialgraphy.com).

![](https://dl.dropboxusercontent.com/u/16657557/serialgraphy-1.jpg)
![](https://dl.dropboxusercontent.com/u/16657557/serialgraphy-3.jpg)


## Features
- Shows the Airtime using local timezone
- Ability to change the Timezone to UTC and remember the choice
- Filters out cartoons, reality shows, etc.
- Responsive + Retina-ready

## Browser Compatibility
Since it uses CSS3 it only works on modern browsers and IE9+.


## Install it locally
You can install this app locally if you have PHP >= 5.4 installed on your machine.  
Just copy the downloaded folder somewhere on your hard drive, then set your trakt.tv API key in `./api/index.php`:

```php
//...
$traktKey  = "__YOUR_TRAKT_TV_API_KEY__";
//... 
```
You can sign up for a free api key in [their website](http://trakt.tv/api-docs).  
Then:

```bash
$ cd /path/to/serialgraphy
$ php -S 127.0.0.1:8080
```
and then navigate to http://127.0.0.1:8080 in your browser and you're set.

## Install on a server
Just upload the downloaded folder (or pull from Github) to a working web server and you're done.

## License
Serialgraphy is created by [Sallar Kaboli](http://sallar.me) and it's released under the [MIT License](http://opensource.org/licenses/mit-license.php).

    The MIT License (MIT)

    Copyright (c) 2013 Sallar Kaboli

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
