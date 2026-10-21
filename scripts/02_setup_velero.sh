#!/bin/bash
BUCKET=$1
if [ -z "$BUCKET" ]; then echo "Usage: ./02_setup_velero.sh <BUCKET_NAME>"; exit 1; fi

echo "Downloading Velero CLI..."
curl -L -o velero.tar.gz https://github.com/vmware-tanzu/velero/releases/download/v1.11.1/velero-v1.11.1-linux-amd64.tar.gz
tar -xvf velero.tar.gz
sudo mv velero-v1.11.1-linux-amd64/velero /usr/local/bin/

echo "Installing Velero into cluster..."
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.7.0 \
    --bucket $BUCKET \
    --backup-location-config region=us-east-1 \
    --secret-file ./credentials-velero
echo "Velero setup complete."
