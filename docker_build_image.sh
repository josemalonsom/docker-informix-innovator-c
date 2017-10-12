#!/bin/bash

set -e

. docker.conf

docker build -t $DOCKER_ID_USER/${IMAGE_NAME}:$TAG .
