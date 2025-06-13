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
db_cluster_identifier = var.db_identifier
db_cluster_snapshot_identifier = "${var.db_identifier}-snapshot-${var.snapshot_date}"
}