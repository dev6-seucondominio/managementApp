# config/initializers/sidekiq.rb

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://172.17.0.9:6380", namespace: 'sidekiq_development'  }
end
