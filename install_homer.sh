#!/bin/sh
mkdir -p /home/docker/homer
cd /home/docker/homer
docker pull b4bz/homer
docker run -d -p 8095:8080 -v /home/docker/homer:/home/homer --name="homer" --restart=always b4bz/homer:latest
cd