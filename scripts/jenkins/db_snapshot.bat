@echo off
terraform init
terraform plan
set TF_VAR_snapshot_date=%5
echo %5 > file.txt

terraform apply --auto-approve
rem terraform apply --auto-approve