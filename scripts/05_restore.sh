#!/bin/bash
echo "Simulating disaster by deleting the default namespace deployments..."
kubectl delete deployments --all -n default

echo "Restoring from Velero backup..."
velero restore create --from-backup k8s-backup-1 --wait
echo "Restore complete. Verifying resources:"
kubectl get pods -n default
