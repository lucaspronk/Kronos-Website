# Development

## 1. Prerequisites
Apart from a text editor or IDE (like RubyMine), you'll need to install Vagrant to follow this guide.

### 1.1 Vagrant
Amongst other things, Vagrant is a handy tool to quickly set up and run virtual machines. A config file is used to
configure the machine, ensuring that your development environment is the same, regardless on what system you run it.
Vagrant works on OS X, Windows, Debian and Centos and can be downloaded from https://www.vagrantup.com/downloads.html.
Vagrant interfaces with VirtualBox, which actually runs the virtual machines. Don't worry though, it will be installed
 for you automatically (unless you uncheck this option) when installing Vagrant.

## 2. Starting the development environment

After you've installed Vagrant, it's time to fire up the development environment! Open up a terminal/cmd in the root
 folder of this project. This is the directory that also contains the file ```Vagrantfile```. This file contains the
 configuration for the virtual machine we need. To start the virtual machine type: ```vagrant up```. Time to get a cup
 of coffee, this might take a while!

In a nutshell, Vagrant will boot up a ubuntu/trusty64 VM with
2048MB of memory, open up port 3000 so we can connect to our Ruby app and then run a bootstrap script. This script is
```bootstrap.sh```, which you can also find in the root directory of this project. The bootstrap script will start by
installing all the needed linux software and then moves on to installing your ruby gems.

When this is done, we (currently) need some manual labour to get Kronos Website running.

## 3. Setting up the database
Before we can start our web server, we first need to configure the database. Kronos Website uses a PostgreSQL database
 and we need to tell ruby which databse to use.

### 3.1 The config file
The project includes an example databate config file
 ```config/database.yml.example``` which you must copy to ```config/database.yml```. **Never add this file to versioning,
 it will contain plain-text passwords which you don't want the world to see.**

The config file needs some extra info before it works. Add a username and password:
````yaml
 common: &common
 adapter: postgresql
 host: localhost
 username: postgres
 password: [PickARandomPassword]
````

If we would try to run the server now (but you haven't told me how!), we would get an error telling us that authentication
has failed for user postgres. This is of course not surprising: we haven't set up PostgreSQL itself yet! So what better
time to do that next?

### 3.2 Configuring PostgreSQL
We will need ```[PickARandomPassword]``` during the config, so keep the config file open for now.
TODO: write how to configure PostgreSQL
TODO: write how to ssh into the box!

### 4. Run the server
```bundle exec thin start```

### 5. Stopping vagrant
To shop the virtual machine, type ```vagrant halt```. If you want to completely remove it, type ```vagrant destroy``` and
 pick ```y``` when asked if you are sure. **If you destroy the VM, your files will not be lost. You WILL need to provision
 the VM again next time, so unless you like coffee and waiting a lot, I wouldn't do this too often.**

## Troubleshooting

### 1. NFS is not working
To speed up the virtual machine, NFS (Network File System) is used to link the filesystems of the host and guest machine.
  On windows this is quite a common problem. You should be able to get it working using https://github.com/winnfsd/vagrant-winnfsd.