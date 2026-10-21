#!/bin/bash
echo "Triggering Velero backup for the 'default' namespace..."
velero backup create k8s-backup-1 --include-namespaces default --wait
echo "Backup completed."
velero backup describe k8s-backup-1
