#!/bin/bash -il
pwd
rm -rf ./dockerbuild
mkdir ./dockerbuild
cp ../*/target/*.jar ./dockerbuild
cp ./Dockerfile ./dockerbuild

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://master1g7.cs-cn-hangzhou.aliyun.com:23193"
export DOCKER_CERT_PATH="/Users/liuxian/workspace/yunmengWorkspace/dockerSpace/certFiles"

/usr/local/bin/docker images

pwd
cd ./dockerbuild
pwd