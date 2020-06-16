#!/bin/bash
set -eo pipefail

echo "#################################### Docker Credentials"
echo "Ensure you have docker config from here:"
echo "https://cloud.digitalocean.com/images/container-registry?i=3e5439"
echo ""

echo "#################################### Docker Build"
if [ -z ${IMAGE} ]; then
  echo "Error: IMAGE must be defined:"
  echo "IMAGE=registry.digitalocean.com/docker-registry-b63863a4/mediasoup-server:20200616 ${0}"
  exit 1
else
  docker build -t registry.digitalocean.com/docker-registry-b63863a4/mediasoup-server:20200616 .
fi
echo ""

echo "#################################### Docker Push"
docker push registry.digitalocean.com/docker-registry-b63863a4/mediasoup-server:20200616
