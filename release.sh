#!/bin/bash -e
# release to docker hub
VER=$(cat Dockerfile | grep "^FROM" | awk -F: '{print $2;}')

echo "Logging in to dockerhub"
docker login || exit 2

echo "Building goethite/gostint-vault:$VER image"
docker build -t goethite/gostint-vault:$VER . || exit 2

echo "Pushing goethite/gostint-vault:$VER to dockerhub"
docker push goethite/gostint-vault:$VER || exit 2
