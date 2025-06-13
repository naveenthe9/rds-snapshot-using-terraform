#!/bin/bash

set -e
run() {

  AWS_PROFILE=$1
  REGION=$2
  AWS_KEY=$3
  AWS_SECRET=$4
  T_DATE=$5
  DB_IDENTIFIER=$6


  echo 'Configure aws...'
  rm -f ~/.aws/credentials
  echo "$pwd"
  pwd
  aws configure set aws_access_key_id $AWS_KEY --profile $AWS_PROFILE
  aws configure set aws_secret_access_key $AWS_SECRET --profile $AWS_PROFILE
  cat ~/.aws/credentials

SNAPSHOT_ID="${6}-snapshot-${5}"
echo "$SNAPSHOT_ID"
echo "SNAPSHOT_ID is : $SNAPSHOT_ID"


#Check if the Snapshot exists

echo "Checking if snapshot '$SNAPSHOT_ID' exists in region '$REGION'..."

  if aws rds describe-db-cluster-snapshots \
      --region "$REGION" \
      --db-cluster-snapshot-identifier "$SNAPSHOT_ID" \
      --profile "$AWS_PROFILE" \
      --query "DBClusterSnapshots[?DBClusterSnapshotIdentifier=='$SNAPSHOT_ID']" \
      --output text > /dev/null 2>&1; then
    echo "Snapshot '$SNAPSHOT_ID' exists. Deleting..."
    aws rds delete-db-cluster-snapshot \
      --region "$REGION" \
      --db-cluster-snapshot-identifier "$SNAPSHOT_ID" \
      --profile "$AWS_PROFILE"
  else
    echo "Snapshot '$SNAPSHOT_ID' does not exist. Skipping deletion."
  fi

# Switch to the terraform directory
cd ../terraform/ || exit 1

# Print current directory

# Set the snapshot date from the 5th argument
TF_VAR_profile="$1"
TF_VAR_region="$2"
TF_VAR_snapshot_date="$5"
TF_VAR_db_identifier=$6
export TF_VAR_profile
export TF_VAR_snapshot_date
export TF_VAR_region
export TF_VAR_db_identifier
echo "region is : $TF_VAR_region"
echo "db_identifier is : $TF_VAR_db_identifier"

# Run Terraform commands
terraform init
terraform plan
terraform apply --auto-approve
}

run "$@"
