#!/bin/bash

docker volume create --driver local --label example=pg-label pg-shared

docker run -d --name pgdb --volume pg-shared:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres postgres

# execute 'docker exec -t -i pgdb bash' to get inside pgdb container
# execute psql -U postgres and create test database
# stop pgdb container
# remove pgdb container

# create new postgres container and check that database created in previous step is still present
docker run -d --rm --name pgdb2 --volume pg-shared:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres postgres
