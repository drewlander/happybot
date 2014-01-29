class AutoKick
  include Cinch::Plugin
  listen_to :join
  match /autoop (on|off|)$/
  match /asshat (.+)/, method: :asshat
  match /command2 (.+)/, method: :command2
  match /^command3 (.+)/, use_prefix: false

  def listen(m)
#    @admins = ['gtsphere', 'drewlander', 'FU5T']
     @admins = IO.readlines('plugins/admins.txt')
    unless @admins.include?(m.user.nick)
       m.channel.kick(m.user)
    end
  end
  def asshat(m, arg)
    m.reply "#{arg} is an asshat"
  end

  def command2(m, arg)
    m.reply "command2, arg: #{arg}"
  end

  def execute(m, arg)
    m.reply "command3, arg: #{arg}"
  end
end

