Vagrant.configure("2") do |config|
  config.ssh.shell = "bash"
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.provision "shell", inline: <<SHELL
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y software-properties-common make linux-image-extra-$(uname -r) docker-engine
gpasswd -a vagrant docker
cat <<EOF > /etc/default/docker
DOCKER_OPTS="--storage-driver=aufs"
EOF
service docker restart
echo "cd /vagrant" > /home/vagrant/.bashrc
SHELL

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 6
  end
end
