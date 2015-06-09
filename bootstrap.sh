# Install linux dependencies
apt-get update
apt-get install -y sqlite3 curl git libpq-dev ruby1.9.3

# Install RVM and subsequently Ruby & Rails
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby=1.9.3 --rails

# Add bundler to install bundles
gem install rails bundler

# Install bundles
cd /vagrant & bundle install & bundle update

# Start thin server in development mode (default)
bundle exec thin start