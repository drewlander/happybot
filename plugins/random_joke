class RandomJoke
  include Cinch::Plugin
  require 'rss'
  require 'open-uri'
  require 'wunderground'
  match /joke/, method: :joke

 def joke(m)
    url = 'http://www.jokesareawesome.com/rss/random/'
    rss = open(url).read
    feed = RSS::Parser.parse(rss, false)
    m.reply "#{feed.channel.items[0].content_encoded}"
  end
end
