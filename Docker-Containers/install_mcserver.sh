#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

sudo docker pull marctv/minecraft-papermc-server:latest || error "Failed to pull latest Minecraft Paper docker image!"
sudo docker run -d -it --name mcserver --restart=unless-stopped -e MEMORYSIZE='4G' -v ~/mcserver:/data:rw -p 25565:25565 -i marctv/minecraft-papermc-server:latest || error "Failed to run Minecraft Paper docker image!"
