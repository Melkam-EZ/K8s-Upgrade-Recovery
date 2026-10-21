#!/bin/bash
echo "Upgrading K3s to v1.28..."
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.28.2+k3s1" sh -
echo "Waiting for control plane to stabilize..."
sleep 20
kubectl get nodes
echo "Upgrade complete. New Version:"
kubectl version --short
