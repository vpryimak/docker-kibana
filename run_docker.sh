#!/bin/bash

JOB=$(docker run -d -p 5601:5601 --name=kibana kibana --link elasticsearch:elasticsearch)

docker inspect -f "{{ .NetworkSettings.IPAddress }}" $JOB
docker inspect -f "{{ .NetworkSettings.PortMapping }}" $JOB
docker inspect -f "{{ .NetworkSettings.Ports }}" $JOB
