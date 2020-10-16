#!/bin/bash

set -x

if [[ -z "${TARGET_TAG}" ]]; then
    TARGET_TAG=v1.5.0
fi
if [[ -z "${TARGET_REPO}" ]]; then
    TARGET_REPO=lisy09kubesphere/fluent-bit
fi

TARGET_REPO=$TARGET_REPO \
    TARGET_TAG=$TARGET_TAG \
    docker buildx bake -f docker-bake.hcl \
    --push

docker manifest create -a ${TARGET_REPO}:${TARGET_TAG} \
    ${TARGET_REPO}:${TARGET_TAG}-amd64 \
    ${TARGET_REPO}:${TARGET_TAG}-arm64 \
    ${TARGET_REPO}:${TARGET_TAG}-armv7
docker manifest push ${TARGET_REPO}:${TARGET_TAG}