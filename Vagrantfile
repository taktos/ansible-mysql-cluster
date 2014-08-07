# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$script = <<SCRIPT
if ! [ `which ansible` ]; then
	yum install -y http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
	yum install -y ansible
fi
ansible-playbook -i /vagrant/ansible/hosts /vagrant/ansible/playbook.yml
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "opscode-centos-6.5"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "mysql-cluster"

  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=775', 'fmode=664']

  config.vm.provision "shell", inline: $script
end

