#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

wget -qO- https://raw.githubusercontent.com/Ninja-Yubaraj/Docker-Server/main/install_docker.sh | bash || error "Failed to install Docker."
