#!/bin/bash

LOG_SRC=/root/example.log
LOG_DST=/var/log/nginx/custom.host.access.log

docker run -d --name diaweb5 --mount type=bind,src=/root/example.conf,dst=/etc/nginx/conf.d/default.conf -p 81:81 --mount type=bind,src=${LOG_SRC},dst=${LOG_DST} --rm nginx:latest

unset LOG_SRC
unset LOG_DST
