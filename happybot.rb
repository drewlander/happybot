require 'cinch'
require './plugins/autokick'
require './plugins/getweather'
require './plugins/random_joke'
require './plugins/tinyurl'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick            = "happybot"
    c.server          = "irc.freenode.org"
    c.channels        = ["#mychan"]
    c.verbose         = true
    c.plugins.plugins = [AutoKick, GetWeather, RandomJoke, TinyURL]

  end
end

bot.start
