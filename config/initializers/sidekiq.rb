require 'sidekiq/api'
redis_config = { namespace: 'sidekiq_development', :size => 5 }

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
