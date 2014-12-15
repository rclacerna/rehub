source 'http://rubygems.org'
ruby '2.0.0'

gem 'pg'
# my gem, gets you tf-idf weights
gem 'tf_idf_hash', :git => "https://github.com/rclacerna/tf_idf_hash_gem.git"
# reads PDF and extract the data from it
gem 'pdf-reader', '~> 1.3.3'
# https
gem 'rack-ssl-enforcer'
# draper, a gem for the decorator design pattern
gem 'draper'
# this gem we use to give us the word counts
gem 'tf-idf-similarity'
# Ivin's gem Cosine sim
gem 'Cosine_similarity_hash', '~> 0.0.2', :git => 'https://github.com/ivinpolosony/Cosine_similarity_hash.git'
# observer pattern
gem 'rails-observers'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

#bootstrap to make our site look pretty
gem 'bootstrap-sass', '~> 3.1.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

gem 'devise'

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', '~> 0.4.0'
end

group :development do
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'
	gem 'rspec-rails'
	gem 'factory_girl_rails'
end

group :test do
	gem 'capybara'
end

group :production do
	gem 'pg'
end