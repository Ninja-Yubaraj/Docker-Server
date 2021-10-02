#!/bin/sh
mkdir -p /home/docker
cd /home/docker
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER
echo "remember to logoff to take effect"
