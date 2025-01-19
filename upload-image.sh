#!/bin/bash

PROFILE="prod"

if [[ "$*" == *"-s"* ]]; then
  echo "Skipping package step"
else
  echo "Starting packaging project"
  # 将当前目录挂载到容器中作为代码目录
  # '/usr/src/app' 为容器中 Maven 的默认代码目录
  # 通过 '-w' 选项指定容器的工作目录
  docker run --rm -it -v $(pwd):/usr/src/app -w /usr/src/app maven:3.6.3-openjdk-8 \
    mvn clean package -DskipTests -P$PROFILE -Dmaven.aliyun.repository=https://maven.aliyun.com/repository/public/

  echo "Project packaged with profile ${PROFILE}!"
fi

# 构建 Docker 镜像
docker build -t hub.aiyax.com/aiyax/one-service:v0.9.0 .
