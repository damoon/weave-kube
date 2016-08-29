#! /bin/sh

set -e

WEAVE_VERSION=${WEAVE_VERSION:-latest}
IMAGE_VERSION=${IMAGE_VERSION:-$WEAVE_VERSION}
IMAGE_NAME=${IMAGE_NAME:-weaveworks/weave-kube}

# Extract other files we need
NAME=weave-kube-$$
docker create --name=$NAME weaveworks/weave:$WEAVE_VERSION
docker cp $NAME:/home/weave/weaver image
docker cp $NAME:/weavedb/weavedata.db image
docker cp $NAME:/etc/ssl/certs/ca-certificates.crt image
docker rm $NAME

# Build the end product
docker build -t $IMAGE_NAME:$IMAGE_VERSION image
