#! /usr/bin/env bash

export ELASTICSEARCH_PORT_9200_TCP_ADDR=${ELASTICSEARCH_PORT_9200_TCP_ADDR}
export ELASTICSEARCH_PORT_9200_TCP_PORT=${ELASTICSEARCH_PORT_9200_TCP_PORT}

sed -i "s/^elasticsearch_url: .*$/elasticsearch_url: \"http:\/\/${ELASTICSEARCH_PORT_9200_TCP_ADDR}:${ELASTICSEARCH_PORT_9200_TCP_PORT}\"/g" /opt/kibana/config/kibana.yml

su kibana -s /bin/bash -c '/opt/kibana/bin/kibana'
