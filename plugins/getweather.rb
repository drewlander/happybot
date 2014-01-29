class GetWeather
  include Cinch::Plugin
  require 'wunderground'
  match /weather (.+)/, method: :weather
  
  def weather(m, arg)
    w_api = Wunderground.new('api_key')
    r = w_api.forecast_and_conditions_and_alerts_for(arg)
    fcst_today = r['forecast']['txt_forecast']['forecastday'][0]['fcttext']
    fcst_tomorrow = r['forecast']['txt_forecast']['forecastday'][1]['fcttext']
    cur_sky = r['current_observation']['weather']
    cur_temp = r['current_observation']['temp_f']
    cur_wind = r['current_observation']['wind_mph']
    cur_wind_dir = r['current_observation']['wind_dir']
    cur_gust = r['current_observation']['wind_gust_mph']
    cur_city = r['current_observation']['display_location']['full']
    m.reply "Weather for #{cur_city}"
    m.reply "forecast for today is: #{fcst_today}"
    m.reply "forecast for tomorrow is: #{fcst_tomorrow}"
    m.reply "Currently it is #{cur_sky} and #{cur_temp} degrees with the wind from the #{cur_wind_dir} at #{cur_wind} mph with gusts to #{cur_gust}"    
  unless r['alerts'].empty?
     m.reply "Current Alerts: "
     r['alerts'].each do |x|
        m.reply x['description']
     end
  end
end

end

