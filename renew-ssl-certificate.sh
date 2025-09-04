#!/bin/bash
# Script to renew Let's Encrypt certificates and restart Nginx
certbot renew --quiet --post-hook "systemctl reload nginx"
