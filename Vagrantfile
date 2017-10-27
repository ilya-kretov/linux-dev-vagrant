
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provision "shell", path: "install.sh"

  config.vm.synced_folder "scripts", "/opt/scripts"

  config.vm.network "private_network", ip: "192.168.22.24"

  config.vm.network "forwarded_port", guest: 9200, host: 9201

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
    vb.gui = true
    vb.name = "Ubuntu Dev Workstation"
  end

end
