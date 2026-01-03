#!/bin/bash
#By Anggarda Saputra Wijaya
#Create Docker Container N8N Selfhosted Non-SSL
sudo apt-get update -y
sudo apt-get install curl software-properties-common docker.io -y
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo apt-get update -y
mkdir /home/portainer
mkdir /home/n8n
cp support/docker-portainer.yml /home/portainer/docker-compose.yml
cp support/docker-n8n.yml /home/n8n/docker-compose.yml
cd /home/portainer && docker-compose up -d
cd /home/n8n && docker-compose up -d
docker ps -a
ufw allow 22
ufw allow 19443
ufw allow 15678
ufw enable
systemctl status ufw
