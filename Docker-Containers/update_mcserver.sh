#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

mcserver_pid=`docker ps | grep minecraft-papermc-server | awk '{print $1}'`
mcserver_name=`docker ps | grep minecraft-papermc-server | awk '{print $2}'`

sudo docker stop $mcserver_pid || error "Failed to stop mcserver!"
sudo docker rm $mcserver_pid || error "Failed to remove mcserver container!"
sudo docker rmi $mcserver_name || error "Failed to remove/untag images from the container!"
sudo docker run -d -it --name mcserver --restart=unless-stopped -e MEMORYSIZE='4G' -v ~/mcserver:/data:rw -p 25565:25565 -i marctv/minecraft-papermc-server:latest || error "Failed to execute newer version of mcserver!"
