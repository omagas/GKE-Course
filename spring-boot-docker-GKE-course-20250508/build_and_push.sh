#!/bin/bash

# 檢查是否提供了版本號
if [ -z "$1" ]; then
    echo "請提供版本號作為參數，例如： ./build_and_push.sh a0.4"
    exit 1
fi

# 您的 Docker 映像名稱和 ECR 存儲庫位置
IMAGE_NAME="spring-helloworld-image"
VERSION="$1"
REPOSITORY="384533264466.dkr.ecr.ap-northeast-1.amazonaws.com"

# Docker build
#docker build -t "$IMAGE_NAME:$VERSION" -f ./Dockerfile_adot .

# Docker tag
docker tag "$IMAGE_NAME:$VERSION" "$REPOSITORY/$IMAGE_NAME:$VERSION"

# Docker push
docker push "$REPOSITORY/$IMAGE_NAME:$VERSION"

