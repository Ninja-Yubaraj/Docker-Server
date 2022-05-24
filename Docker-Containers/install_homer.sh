#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

mkdir -p /home/docker/homer || error "Could not create /home/docker/homer"
cd /home/docker/homer || error "Could not cd to /home/docker/homer"
sudo docker pull b4bz/homer || error "Could not pull b4bz/homer"
sudo docker run -d -p 8095:8080 -v /home/docker/homer/Config/Homer/assets:/www/assets --name="homer" --restart=always b4bz/homer:latest || error "Could not run homer"
cd /home/docker || error "Could not cd into /home/docker"
