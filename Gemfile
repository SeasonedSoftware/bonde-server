source 'https://rubygems.org'
ruby '2.4.4'

gem 'rails', '4.2.10'
gem 'rails-api'
gem 'spring', group: :development
gem 'pg'
#gem 'devise_token_auth'
#gem 'devise-jwt'
gem 'bcrypt'
gem 'jwt'
gem 'omniauth'
gem 'rack-cors', require: 'rack/cors'
gem 'carrierwave'
gem 'responders'
gem 'rmagick'
gem 'fog'
gem 'active_model_serializers'
gem 'machinist', '>= 2.0.0.beta2'
gem 'pundit'
gem 'gibbon', '>= 2'
gem 'redis', '3.3.0'
gem 'sidekiq'
gem 'puma'
gem 'platform-api'
gem 'pagarme', '2.1.2'
gem 'sentry-raven'
gem 'has_scope'
gem 'postgres-copy'
gem 'statesman', '2.0.1'
gem "liquid"
gem 'acts-as-taggable-on', '~> 4.0'
gem 'aws-sdk', '~> 2'
gem 'net-dns'
gem 'whenever', require: false
gem 'codacy-coverage', require: false
gem 'codecov', :require => false, :group => :test
gem 'rubocop', require: false


group :staging, :production do
  gem 'newrelic_rpm', '3.15.0.314'
  gem 'rails_stdout_logging'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'shoulda-matchers', '< 3.0.0'
  gem 'byebug'
  gem 'pry'
  gem 'factory_girl_rails', '~> 4.8'
end

group :test do
  gem 'webmock', '2.3.1'
  gem "fakeredis", require: "fakeredis/rspec"
  gem 'simplecov', require: false
  gem 'test_after_commit'
  gem 'rspec_junit_formatter'
end
