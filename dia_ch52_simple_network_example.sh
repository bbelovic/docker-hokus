#!/bin/bash
NETWORK_ID=$(docker network create --driver bridge --attachable --scope local --label project=dockerinaction --label chapter=5 --subnet 10.0.44.0/24 --ip-range 10.0.44.128/25 network-example1)

chmod a+x ./get_index.sh

NGINX_NAME="nginx"
NGINX_CID=$(docker run -d --rm --name $NGINX_NAME --network $NETWORK_ID nginx:latest)

ALPINE_NAME="alpine"
ALPINE_CID=$(docker run -d --name $ALPINE_NAME --network $NETWORK_ID -v $PWD:/opt alpine:latest sh /opt/get_index.sh)

docker stop $NGINX_CID
docker stop $ALPINE_CID
docker rm $ALPINE_CID

docker network rm $NETWORK_ID
