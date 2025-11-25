#!/bin/bash
#By Anggarda Saputra Wijaya
#Create Docker Container N8N Selfhosted Non-SSL
echo "                                                    ";
echo "   ==============================================   ";
echo "        Create Docker Container N8N Non-SSL         ";
echo "   ==============================================   ";
echo "                                                    ";
echo -n "   Create User for N8N Container      : "
read USER
echo -n "   Create Password for N8N Container  : "
read PASSWORD
echo "                                                    ";
echo "   ==============================================   ";
echo "                                                    ";
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt update && sudo apt install nginx certbot python3-certbot-nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo apt-get install docker.io -y
docker run -d --name n8n -p 5678:5678 -e N8N_BASIC_AUTH_ACTIVE=true -e N8N_BASIC_AUTH_USER=$USER -e N8N_BASIC_AUTH_PASSWORD=$PASSWORD -e N8N_SECURE_COOKIE=false -e N8N_PORT=5678 -e GENERIC_TIMEZONE=UTC+7 -v ~/.n8n:/home/node/.n8n n8nio/n8n
docker ps -a
sudo chown -R 1000:1000 ~/.n8n
sudo chmod -R 755 ~/.n8n
docker start n8n
docker ps -a
docker update --restart unless-stopped n8n
ufw allow 80
ufw allow 22
ufw allow 443
ufw allow 5678
ufw enable
systemctl status ufw
echo "   ==============================================   ";
echo "     Access Website [http://youripaddress:5678]     ";
echo "   ==============================================   ";
