# Kubernetes Platform Upgrade and Recovery

This project demonstrates disaster recovery and platform upgrades in a Kubernetes environment. It uses Terraform to provision the infrastructure (EC2 + S3 Bucket for backups) and automates backups using Velero.

## Repository Structure
- `terraform/`: Infrastructure as Code for the K8s node and Velero S3 backup bucket.
- `scripts/`: Scripts to install K3s, configure Velero, trigger backups, and perform upgrades.
- `app/`: Sample application to test data persistence.
- `tests/`: Validation scripts.
- `.github/workflows/`: CI pipeline configuration.

## Setup Instructions

1. **Deploy Infrastructure**
   - cd into `terraform/`
   - Run `terraform init` and `terraform apply -auto-approve`
   - *Note the S3 bucket name and IAM credentials from the output.*

2. **Configure Cluster & App**
   - SSH into the instance and run `./scripts/01_install_cluster.sh`
   - Deploy the sample app: `kubectl apply -f app/`

3. **Backup, Upgrade, and Recover**
   - Run `./scripts/02_setup_velero.sh <BUCKET_NAME>` to initialize backups.
   - Run `./scripts/03_trigger_backup.sh` to backup the cluster state.
   - Run `./scripts/04_upgrade_cluster.sh` to simulate a Kubernetes control plane upgrade.
   - Run `./scripts/05_restore.sh` to verify recovery functionality.
