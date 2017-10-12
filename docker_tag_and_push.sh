#!/bin/bash

set -e

. docker.conf

docker tag $DOCKER_ID_USER/${IMAGE_NAME} $DOCKER_ID_USER/${IMAGE_NAME}:$TAG

docker login -u $DOCKER_ID_USER
docker push $DOCKER_ID_USER/${IMAGE_NAME}:$TAG
docker push $DOCKER_ID_USER/${IMAGE_NAME}:latest
docker logout
