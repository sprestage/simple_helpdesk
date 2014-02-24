source 'https://rubygems.org'
# Specify ruby version for Heroku deploy
ruby '2.0.0'

gem 'rails', '3.2.17'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'mail'
gem 'postmark'
gem 'postmark-rails'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

gem 'jquery-rails'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'minitest'
  gem 'minitest-rails'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-debugger'
  gem 'figaro'
end

group :test do
  gem 'turn'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
