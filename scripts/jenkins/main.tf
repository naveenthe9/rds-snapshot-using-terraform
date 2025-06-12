terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }
}

resource "aws_db_cluster_snapshot" "development-database-snapshot" {
db_cluster_identifier = "sttaq-preprod"
db_cluster_snapshot_identifier = "development-database-snapshot-${var.snapshot_date}"
}