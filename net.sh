#!/bin/sh
IP_ADDR=$(hostname -i)
WEB_CNAME="web"
#apk update && apk add nmap
WEB_IP=$(nmap -sn 10.0.42.*  -oG /dev/stdout | grep Status | grep -v $IP_ADDR | grep $WEB_NAME | cut -f 1 | cut -c 7-18)
wget $WEB_IP
