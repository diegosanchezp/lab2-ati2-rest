#!/bin/bash

SCRIPT_FILE_PATH=$(realpath "${BASH_SOURCE[0]:-$0}")
SCRIPT_DIR=$(dirname "$SCRIPT_FILE_PATH")
# ../../
ROOT_DIR=$(dirname "$SCRIPT_DIR")
COMPOSE_FILE=$ROOT_DIR/docker/dev/docker-compose.yml

export COMPOSE_FILE

echo "SETUP DJANGO IN DOCKER"
docker-compose up -d postgres && \
docker-compose run -w /app --entrypoint bash --rm django shscripts/setup_docker_dev.sh && \

echo "LOADING COMMAND UTILITIES" && \

source "$SCRIPT_DIR/dev.sh"
