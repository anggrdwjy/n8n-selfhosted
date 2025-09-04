#!/bin/bash
#BY Anggarda Saputra Wijaya
#Add DNS Record Cloudflare
echo "                                                    ";
echo "   ==============================================   ";
echo "             Add DNS Record Cloudflare              ";
echo "   ==============================================   ";
echo "                                                    ";
echo -n "   Cloudflare Zone-ID      : "
read ZONE_ID
echo -n "   Cloudflare API-Key      : "
read API_ID
echo -n "   Add Domain DNS Record   : "
read DOMAIN
echo -n "   Pointing Public IP      : "
read PUBLIC_IP
echo "                                                    ";
echo "   ==============================================   ";
echo "                                                    ";
sudo cp support/cloudflare-dnsrecord.sh add_dns.sh
sed -i "s/zone_id/$ZONE_ID/g" add_dns.sh
sed -i "s/api_id/$API_ID/g" add_dns.sh
sed -i "s/domain/$DOMAIN/g" add_dns.sh
sed -i "s/public_ip/$PUBLIC_IP/g" add_dns.sh
chmod -R 777 add_dns.sh
./add_dns.sh
rm -rf add_dns.sh
