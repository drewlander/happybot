require 'cinch'
require './plugins/autokick'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick            = "cinch_multi"
    c.server          = "irc.freenode.org"
    c.channels        = ["#mychannel"]
    c.verbose         = true
    c.plugins.plugins = [AutoKick]

  end
end

bot.start
