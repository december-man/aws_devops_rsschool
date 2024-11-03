#!/bin/bash
# Enable selinux
sudo amazon-linux-extras enable selinux-ng
sudo yum install selinux-policy-targeted -y

# Install k3s Agent
curl -sfL https://get.k3s.io | K3S_URL="https://${server_addr}:6443" K3S_TOKEN=${token} sh -s -