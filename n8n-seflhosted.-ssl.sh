#!/bin/bash
#By Anggarda Saputra Wijaya
#Create Docker Container N8N Selfhosted SSL
echo "   ==============================================   ";
echo "           Create Docker Container N8N SSL          ";
echo "   ==============================================   ";
echo "                                                    ";
echo -n "   Create User for N8N Container      : "
read USER
echo "                                                    ";
echo -n "   Create Password for N8N Container  : "
read PASSWORD
echo "                                                    ";
echo -n "   Your Domain for N8N Container      : "
read YOURDOMAIN
echo "                                                    ";
echo "   ==============================================   ";
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
docker run -d --name n8n -p 5678:5678 -e N8N_BASIC_AUTH_ACTIVE=true -e N8N_BASIC_AUTH_USER=$USER -e N8N_BASIC_AUTH_PASSWORD=$PASSWORD -e N8N_PORT=5678 -e N8N_HOST=$YOURDOMAIN -e WEBHOOK_URL=https://$YOURDOMAIN/ -e GENERIC_TIMEZONE=UTC+7 -v ~/.n8n:/home/node/.n8n n8nio/n8n
docker ps -a
sudo chown -R 1000:1000 ~/.n8n
sudo chmod -R 755 ~/.n8n
docker start n8n
docker ps -a
docker update --restart unless-stopped
echo "   ==============================================   ";
echo "    Access Website [https://youripaddress:5678]     ";
echo "   ==============================================   ";
