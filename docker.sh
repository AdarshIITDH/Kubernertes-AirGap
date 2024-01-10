#!/bin/bash

echo -e "\n Installing Docker"
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_23.0.2-1~ubuntu.22.04~jammy_amd64.deb
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.6.19-1_amd64.deb
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.17.2-1~ubuntu.22.04~jammy_amd64.deb
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-rootless-extras_23.0.2-1~ubuntu.22.04~jammy_amd64.deb
curl -O https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_23.0.2-1~ubuntu.22.04~jammy_amd64.deb

echo -e "\n Done"
