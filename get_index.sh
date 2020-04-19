#!/bin/sh
IP_ADDR=$(hostname -i)
WEB_CNAME="nginx"
apk update && apk add nmap
WEB_IP=$(nmap -sn 10.0.44.*  -oG /dev/stdout | grep Status | grep -v $IP_ADDR | grep $WEB_CNAME | cut -f 1 | cut -c 7-18)
wget $WEB_IP
mv /index.html /opt
echo "Moved"
