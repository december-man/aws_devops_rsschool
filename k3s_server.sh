#!/bin/bash

# Enable selinux
sudo amazon-linux-extras enable selinux-ng
sudo yum install selinux-policy-targeted -y

# Install k3s Server
curl -sfL https://get.k3s.io | K3S_TOKEN=${token} sh -s -

# Configure kubeconfig for non-root access
mkdir -p /home/ec2-user/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/ec2-user/.kube/config
sudo chown ec2-user:ec2-user /home/ec2-user/.kube/config
sudo chmod 600 /home/ec2-user/.kube/config
sudo ln -s /usr/local/bin/k3s /usr/bin/k3s
echo 'export KUBECONFIG="/home/ec2-user/.kube/config"' >> /home/ec2-user/.bashrc
source /home/ec2-user/.bashrc

# Install Additional Packages
sudo yum install telnet -y
sudo amazon-linux-extras install epel -y --nogpgcheck
sudo yum install stress -y

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh