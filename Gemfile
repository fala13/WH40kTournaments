source 'http://rubygems.org'

gem "rails", "3.2.8"

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'haml'
gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem "bcrypt-ruby", :require => "bcrypt"
gem 'RedCloth'
gem 'mercury-rails'
gem "friendly_id", "~> 4.0.9"
gem "aasm"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "therubyracer"
  gem 'backbone-on-rails'
  gem "less-rails"
  gem 'sass-rails',   '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.0.3'
  gem "ejs", "~> 1.1.1"
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem "debugger"
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  # Pretty printed test output
  #gem 'turn', :require => false
  gem 'mocha'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :production do
  gem 'pg'
end
