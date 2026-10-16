Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "grpc-server"

  config.vm.network "forwarded_port",
    guest: 50051,
    host: 50051,
    host_ip: "127.0.0.1",
    protocol: "tcp"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision "docker"
end