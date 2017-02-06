# Install linux dependencies
apt-get update
apt-get install -y sqlite3 libsqlite3-dev curl git libpq-dev ruby1.9.3 nodejs build-essential rubygems-integration

# Add bundler to install bundles
gem install rubygems-update
update_rubygems
gem install rails bundler

# Install bundles
cd /vagrant && bundle install

# Start thin server in development mode (default)
bundle exec thin start