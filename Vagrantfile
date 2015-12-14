# -*- mode: ruby -*-
# vi: set ft=ruby :
#

NODES = [
  { :name => :db1,:ip => '192.168.101.128' },
  { :name => :db2,:ip => '192.168.101.129' },
  { :name => :db3,:ip => '192.168.101.130' },
  { :name => :db4,:ip => '192.168.101.131' },
  { :name => :db5,:ip => '192.168.101.132' },
]

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-6.7"

  NODES.each do |opts|
    config.vm.define opts[:name] do |node|
      node.vm.hostname = opts[:name].to_s
      node.vm.network "private_network", ip: opts[:ip]
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
      node.vm.provision "shell", path: "provision/scripts/provision.sh"
    end
  end
end
