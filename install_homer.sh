#!/bin/sh

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

mkdir -p /home/docker/homer || error "Could not create /home/docker/homer"
cd /home/docker/homer || error "Could not cd to /home/docker/homer"
docker pull b4bz/homer || error "Could not pull b4bz/homer"
docker run -d -p 8095:8080 -v /home/docker/homer/Config/Homer/assets:/www/assets --name="homer" --restart=always b4bz/homer:latest || error "Could not run homer"
cd ~ || error "Could not cd to ~"
