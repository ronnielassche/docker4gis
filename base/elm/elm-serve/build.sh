#!/bin/bash
set -e

DOCKER_REGISTRY="${DOCKER_REGISTRY}"
DOCKER_USER="${DOCKER_USER:-merkator}"
DOCKER_REPO="${DOCKER_REPO:-elm-serve}"
DOCKER_TAG="${DOCKER_TAG:-latest}"

IMAGE="${DOCKER_REGISTRY}${DOCKER_USER}/${DOCKER_REPO}:${DOCKER_TAG}"

echo; echo "Building $IMAGE"

docker image build -t "${IMAGE}" .
