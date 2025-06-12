

resource "aws_db_cluster_snapshot" "my_cluster_snapshot4" {
  db_cluster_identifier = "sttaq-dev"
db_cluster_snapshot_identifier = "my-cluster-snapshot2"

lifecycle {
  prevent_destroy = true
}

}