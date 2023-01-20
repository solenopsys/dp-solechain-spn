#!/bin/sh

build_push(){
  docker buildx build  --platform ${ARCHS} -f dgraph.Dockerfile -t ${REGISTRY}/${NAME}:latest  --output=type=registry,registry.insecure=true --push .
}

helm_build_push(){
  FN=${NAME}-${VER}.tgz
  rm ${FN}
  helm package ./install --version ${VER}
  curl --data-binary "@${FN}" http://helm.solenopsys.org/api/charts
}

REGISTRY=registry.solenopsys.org
NAME=solechain-spn
ARCHS="linux/amd64"
VER=0.1.1

helm_build_push
#build_push





