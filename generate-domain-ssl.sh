#!/bin/bash
#By Anggarda Saputra Wijaya
#custom domain NGINX with SSL
echo "                                                    ";
echo "   ==============================================   ";
echo "              Generate Domain with SSL              ";
echo "   ==============================================   ";
echo "                                                    ";
echo -n "   Custom DOMAIN : "
read DOMAIN
echo "                                                    ";
echo "   ==============================================   ";
echo "                                                    ";
sudo cp support/domain /etc/nginx/sites-available/$DOMAIN
sed -i "s/domain/$DOMAIN/g" /etc/nginx/sites-available/$DOMAIN
sudo ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/
sudo systemctl restart nginx
sudo certbot --nginx -d $DOMAIN
