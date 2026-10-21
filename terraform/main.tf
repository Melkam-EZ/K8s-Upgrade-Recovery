terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "k8s_node" {
  ami           = "ami-04a81a99f5ec58529" # Ubuntu 24.04 LTS
  instance_type = "t3.large"
  root_block_device {
    volume_size = 30
  }
  tags = {
    Name = "K8s-Upgrade-Recovery-Node"
  }
}

resource "aws_s3_bucket" "velero_backups" {
  bucket_prefix = "k8s-velero-backups-"
  force_destroy = true
}

output "velero_bucket" {
  value = aws_s3_bucket.velero_backups.id
}
