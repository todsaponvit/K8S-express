#!/bin/bash

echo "This script install kubectl, helm, kind for create K8S Cluster"
echo "1/3 Starting Install kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client
echo "1/3 Install kubectl Successfull"

echo "2/3 Starting Install helm"
wget https://get.helm.sh/helm-v3.17.3-linux-amd64.tar.gz
tar -zxvf helm-v3.17.3-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
echo "2/3 Install helm Successfull"

echo "3/3 Starting Install kind"
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
echo "3/3 Install kind Successfull"

echo "### This Cluster Ready for run K8S ###"
