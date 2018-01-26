# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # Allow prometheus port.
  config.vm.network "forwarded_port", guest: 9090, host: 9090, host_ip: "127.0.0.1"

  # I want to use my host ssh keys.
  config.ssh.forward_agent = true

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get upgrade -y
    apt-get install -y puppet
  SHELL

  # This is the command that vagrant runs:
  # sudo puppet apply --verbose --hiera_config puppet/hiera.yaml --modulepath=puppet/modules puppet/manifests/default.pp
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'default.pp'
    puppet.module_path = 'puppet/modules'
  end

end
