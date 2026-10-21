#!/bin/bash
echo "Installing K3s (Kubernetes) v1.27 (Older version to allow upgrade)..."
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.27.4+k3s1" sh -
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER ~/.kube/config
echo "Cluster installed. Version:"
kubectl version --short
