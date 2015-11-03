# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'kronos-website'

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 4096]
  end

  # Enable NFS for better performance
  # https://github.com/winnfsd/vagrant-winnfsd
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.network "private_network", type: "dhcp"
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provision :shell, :path => "bootstrap.sh"
end