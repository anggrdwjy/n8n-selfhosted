#!/bin/bash
curl -X POST "https://api.cloudflare.com/client/v4/zones/zone_id/dns_records" \
     -H "Authorization: Bearer api_id" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"domain","content":"public_ip","ttl":120,"priority":10,"proxied":true}'
