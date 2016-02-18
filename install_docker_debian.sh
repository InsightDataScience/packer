#!/bin/bash

# Update your apt repository
sudo apt-get purge lxc-docker*
sudo apt-get purge docker.io*

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo sh -c 'echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list'

sudo apt-get update

sudo apt-get install -y tree nmon

# Install and test out docker
sudo apt-get install -y docker-engine
sudo apt-get install -y vim
sudo apt-get install -y curl
sudo service docker start
sudo docker run hello-world

# Give non-root access
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart

