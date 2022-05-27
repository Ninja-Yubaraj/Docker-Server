#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

sudo mkdir -p /home/docker/data/portainer || error "Could not create portainer directory"
cd /home/docker/data/portainer || error "Could not change to portainer directory"
sudo docker pull portainer/portainer-ce:latest || error "Failed to pull latest Portainer docker image!"
sudo docker volume create portainer_data || error "Failed to create portainer data volume"
sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest || error "Failed to run Portainer docker image!"
cd /home/docker || error "Could not cd into /home/docker"