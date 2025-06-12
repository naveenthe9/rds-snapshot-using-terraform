terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_db_cluster_snapshot" "database-snapshot" {
db_cluster_identifier = "sttaq-preprod"
db_cluster_snapshot_identifier = "development-database-snapshot-${var.snapshot_date}"
}