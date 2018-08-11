#!/bin/bash -il
pwd
rm -rf ./dockerbuild
mkdir ./dockerbuild
cp ../*/target/*.jar ./dockerbuild
cp ./Dockerfile ./dockerbuild

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://master1g7.cs-cn-hangzhou.aliyun.com:23193"
export DOCKER_CERT_PATH="/Users/liuxian/workspace/yunmengWorkspace/dockerSpace/certFiles"

docker images

pwd
cd ./dockerbuild
# build to aliyun docker
docker build -t registry.cn-hangzhou.aliyuncs.com/ywsj-test/ywsj-wantsor/liux-test-helloworld-node:0.1 .
