#!/bin/bash

set -e

. docker.conf

if (docker ps -a | grep -q "$CONTAINER_NAME"); then

    echo "A container with name '$CONTAINER_NAME' already exists."
    echo "Do you want to remove it? [N/s]"

    read ANSWER

    if [[ -n "$ANSWER" && ( $ANSWER == "S"  || $ANSWER == "s" ) ]]; then

        docker stop $CONTAINER_NAME
        docker rm $CONTAINER_NAME
    fi
fi

docker run -it --name $CONTAINER_NAME --privileged \
    -p 9088:9088 -p 9089:9089 -p 27017:27017 -p 27018:27018 -p 27883:27883 \
    -e LICENSE=accept $DOCKER_ID_USER/${IMAGE_NAME}:$TAG
