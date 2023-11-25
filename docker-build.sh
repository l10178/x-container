#!/usr/bin/env bash

current_dir=$(
    cd $(dirname $0)
    pwd
)

cd ${current_dir}

export BUILDKIT_PROGRESS=plain

DOCKER_BASE_ORG=docker.io/nxest

DOCKER_SRC=${current_dir}/src/main/docker


APP_DOCKER_FILE=${DOCKER_SRC}/base/Dockerfile
APP_DOCKER_TAG=${DOCKER_BASE_ORG}/base-debian:stable-slim
APP_CONTEXT_PATH=${DOCKER_SRC}/base



# buildx  --no-cache  --platform linux/amd64 --push
docker build --no-cache -t ${APP_DOCKER_TAG} -f ${APP_DOCKER_FILE} ${APP_CONTEXT_PATH}

APP_DOCKER_FILE=${DOCKER_SRC}/openjdk/Dockerfile
APP_CONTEXT_PATH=${DOCKER_SRC}/openjdk
APP_DOCKER_TAG=${DOCKER_BASE_ORG}/openjdk:21-graal-debian

docker build --no-cache -t ${APP_DOCKER_TAG} -f ${APP_DOCKER_FILE} ${APP_CONTEXT_PATH}


APP_DOCKER_FILE=${DOCKER_SRC}/maven/Dockerfile
APP_CONTEXT_PATH=${DOCKER_SRC}/maven
APP_DOCKER_TAG=${DOCKER_BASE_ORG}/maven:3.9-openjdk21-graal-debian

docker build --no-cache -t ${APP_DOCKER_TAG} -f ${APP_DOCKER_FILE} ${APP_CONTEXT_PATH}