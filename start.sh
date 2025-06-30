#!/bin/bash

set -e  # Exit script if any command fails

# Build Docker image for Client Application
docker build -f ./cloud-bus-config-server-client-kafka/Dockerfile \
  -t cloud-config-client \
  ./cloud-bus-config-server-client-kafka

# Build Docker image for Server Application
docker build -f ./cloud-bus-config-server-kafka/Dockerfile \
  -t cloud-config-server \
  ./cloud-bus-config-server-kafka

# Run Docker containers
docker run cloud-config-client
docker run cloud-config-server

# Optionally run Docker Compose if needed
docker-compose up -d
