#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

sudo mkdir -p /home/docker || error "Could not create /home/docker"
cd /home/docker || error "Could not cd into /home/docker"
curl -sSL https://get.docker.com | sh || error "Failed to install Docker."
sudo usermod -aG docker $USER || error "Failed to add user to the Docker usergroup."
echo "Remember to logoff/reboot for the changes to take effect."
cd /home/docker || error "Could not cd into /home/docker"