# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "sbeliakou/centos-6.8-x86_64"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.hostname = "pet"
  
  config.vm.provider "virtualbox" do |vb|
    vb = config.vm.hostname
  end
end
