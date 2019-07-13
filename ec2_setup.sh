#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install docker.io -y
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install docker-ce -y
sudo docker run hello-world
sudo chmod 666 /var/run/docker.sock
docker run -d -p 8000:8000 --name whoami -t jwilder/whoami
curl $(hostname --all-ip-addresses | awk '{print $1}'):8000
