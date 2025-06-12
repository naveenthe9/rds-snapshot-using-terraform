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
  aws configure set aws_access_key_id $AWS_KEY --profile $AWS_PROFILE
  aws configure set aws_secret_access_key $AWS_SECRET --profile $AWS_PROFILE

# Go to the terraform directory
cd ../terraform/ || exit 1

# Print current directory
echo "Current directory: $(pwd)"

# Set the snapshot date from the 5th argument
TF_VAR_snapshot_date=$5
export TF_VAR_snapshot_date
echo "Snapshot date: $TF_VAR_snapshot_date"

# Set AWS profile
export AWS_PROFILE=$1

# Save the 5th argument to a file
echo "$5" > file.txt

# Run Terraform commands
terraform init
terraform plan
terraform apply --auto-approve
}

run "$@"
