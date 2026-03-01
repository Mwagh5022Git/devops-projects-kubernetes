#!/bin/bash
# Install Docker
apt get install docker.io
# add Docker to current user and refresh the Group
sudo usermod -aG docker $USER && newgrp docker
# Create folder and install the Kind-cluster 
echo "Enter the Folder Name : "
read foldername
mkdir -p /home/$USER/$foldername
echo "Folder Created at home directory."
cd $foldername
# Install Kind-Cluster 
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
rm -rf kind
kind --version

