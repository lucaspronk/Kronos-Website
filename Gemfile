source 'http://rubygems.org'

gem 'rails', '3.2.8'
gem 'sqlite3'
gem 'haml', '~> 4.0.5'
gem 'jquery-rails', '~> 2.1.0'
gem 'selectize-rails', '~> 0.8.5'
gem 'nested_form', '~> 0.3.2'
gem 'faker'
gem 'redcarpet', '~> 2.3.0'
gem 'auto_html', '~> 1.6.0'
gem 'twitter-typeahead-rails', '~> 0.10.2'
gem 'thin'
gem 'less-rails'
gem 'sass-rails', '>= 3.2'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'execjs', '~> 2.3.0'

group :development do
  gem 'guard-rspec', '~> 2.5.4'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.11.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  if RUBY_PLATFORM =~ /mingw/
    gem 'therubyracer', '0.11.0beta1', :platform  => [:mswin, :mingw]
  else
    gem 'therubyracer', :platform  => [:ruby]
  end
end
