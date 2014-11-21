class YoMomma
  include Cinch::Plugin
  require 'httparty'
  require 'json'
  match /yomamma (.+)/, method: :yomamma

 def yomamma(m, arg)
    response = HTTParty.get("http://api.yomomma.info",
    :query => {:oauth_token => "joke"})

    json = JSON.parse(response.body)
    m.reply "#{arg}: #{json['joke']}"
  end
end



