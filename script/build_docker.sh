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
imagesid=`docker images|grep -i ywsj-test/ywsj-wantsor|awk '{print $3}'`
if [ ! -n "$imagesid" ]; then
   echo $imagesid "is null"
else
    docker rmi $imagesid -f
fi
# docker rmi registry-vpc.cn-hangzhou.aliyuncs.com/ywsj-test/ywsj-wantsor
# --force-rm remove image first
docker build -t registry-vpc.cn-hangzhou.aliyuncs.com/ywsj-test/ywsj-wantsor:latest .
# push to
docker push registry-vpc.cn-hangzhou.aliyuncs.com/ywsj-test/ywsj-wantsor:latest

# docker run with port:8099
#if docker ps -a|grep -i wantsor-helloworld ;then
#   docker rm -f wantsor-helloworld
#fi

# docker run -it -d -p 9090:9090 --name wantsor-helloworld registry-vpc.cn-hangzhou.aliyuncs.com/ywsj-test/ywsj-wantsor:latest
