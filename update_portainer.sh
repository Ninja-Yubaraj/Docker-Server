#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Go connect to the internet then run the script again."
  fi
}

check_internet

portainer_pid=`docker ps | grep portainer-ce | awk '{print $1}'` || error "Portainer not running. Please start Portainer first."
portainer_name=`docker ps | grep portainer-ce | awk '{print $2}'` || error "Portainer not running. Please start Portainer first."

sudo docker stop $portainer_pid || error "Failed to stop portainer!"
sudo docker rm $portainer_pid || error "Failed to remove portainer container!"
sudo docker rmi $portainer_name || error "Failed to remove/untag images from the container!"
cd /home/docker/data/portainer || error "Failed to change directory to portainer data directory!"
sudo docker pull portainer/portainer-ce:latest || error "Failed to pull portainer image!"
sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest || error "Failed to execute newer version of Portainer!"
cd ~ || error "Failed to change directory to home directory!"