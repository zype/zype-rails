require 'zype'

Zype.configure do |config|
  config.api_key = ENV['ZYPE_API_KEY']
  config.host    = "api.zype.com"
  config.port    = 443
  config.use_ssl = true
end
