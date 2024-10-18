#!/bin/bash

# Enable selinux
sudo amazon-linux-extras enable selinux-ng
sudo yum install selinux-policy-targeted -y

# Install k3s Server
curl -sfL https://get.k3.io | sh -s -

# Configure kubeconfig for non-root access
sudo ln -s /usr/local/bin/k3s /usr/bin/k3s
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
chmod 600 ~/.kube/config
echo 'export KUBECONFIG=~/.kube/config' >> ~/.bashrc
source ~/.bashrc