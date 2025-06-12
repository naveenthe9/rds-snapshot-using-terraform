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

# Go to the terraform directory
cd ../terraform/ || exit 1

# Print current directory

# Set the snapshot date from the 5th argument
TF_VAR_region="$2"
TF_VAR_snapshot_date="$5"
TF_VAR_db_identifier=$6
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
