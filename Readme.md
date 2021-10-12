# Docker
Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels.[[Wiki]](https://en.wikipedia.org/wiki/Docker_(software))

# Docker-Server
The idea is to run multiple "services" inside their "own" docker containers(environments) in a single server, so that, noone can conflict with each other as a result of their different Dependencies.

# About this Project
This project will try to automate all the prerequisites and the "boring stuff" like installing the docker itself or the dependencies or some more tools to make the job easy, so that I or maybe even you can focus on the actual goal instead.

# Can I use this project for my needs?
Yeah sure, You can use this project to automate all those boring stuff I mentioned earlier. Feel free to tweak the scripts to your own needs, however giving this project a shoutout or some credit to my work won't hurt anyone.
# What the scripts do?
- ``./install_docker.sh`` -> this will install docker and add user pi to the docker group.[Logout/Reload Required]
- ``./install_portainer.sh`` -> this will install portainer inside a docker container.
- ``./install_homer.sh`` -> this will install homer inside a docker container.
- ``./update_portainer.sh`` -> this will update portainer and reinstall it.

## Contributors
See the list of [contributors](https://github.com/Ninja-Yubaraj/docker-server/graphs/contributors) who participated in this project.