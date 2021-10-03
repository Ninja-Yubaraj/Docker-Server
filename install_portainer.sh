#!/bin/sh
mkdir -p /home/docker/data/portainer
cd /home/docker/data/portainer
sudo docker pull portainer/portainer-ce:latest
sudo docker volume create portainer_data
sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
cd ~