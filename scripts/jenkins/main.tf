

resource "aws_db_cluster_snapshot" "development-database-snapshot" {
db_cluster_identifier = "sttaq-dev"
db_cluster_snapshot_identifier = "development-database-snapshot-${var.snapshot_date}"
}