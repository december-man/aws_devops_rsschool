#!/bin/bash
# Enable selinux
sudo amazon-linux-extras enable selinux-ng
sudo yum install selinux-policy-targeted -y

# Install k3s Server
curl -sfL https://get.k3s.io | K3S_URL="${server_addr}" K3S_TOKEN=${server_token} sh -s -