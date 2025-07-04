#!/bin/bash
# Dynamically fetch docker.sock GID and add runner to that group

DOCKER_GID=$(stat -c '%g' /var/run/docker.sock || echo 998)

# Create docker group with host GID
groupadd -g 988 docker
usermod -aG docker runner
usermod -aG root runner

