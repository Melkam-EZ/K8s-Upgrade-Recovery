#!/bin/bash
echo "Verifying cluster health..."
kubectl get nodes | grep "Ready"
if [ $? -eq 0 ]; then
  echo "Cluster is healthy."
  exit 0
else
  echo "Cluster is not ready."
  exit 1
fi
