#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

sudo mkdir -p /home/docker || error "Could not create /home/docker"
cd /home/docker || error "Could not cd into /home/docker"
git clone https://github.com/Ninja-Yubaraj/Docker-Server || error "Failed to clone Docker-Server Git repo."
chmod +x Docker-Server/Docker-Containers/*.sh || error "Failed to make Docker-Containers scripts executable."
sudo curl https://raw.githubusercontent.com/Ninja-Yubaraj/Docker-Server/main/install_docker.sh | sudo bash || error "Failed to install Docker."
sudo reboot || error "Failed to reboot. Please reboot manually."