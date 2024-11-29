#!/bin/bash
docker buildx create --use --platform=linux/arm64,linux/amd64 --name multi-platform-builder
docker buildx inspect --bootstrap
docker buildx build --platform=linux/arm64,linux/amd64 --push --tag signalorange/datum-gateway:v0.2.1beta -f ./Dockerfile .