@echo off
set TF_VAR_snapshot_date=%5
echo %5 > file.txt
terraform init
terraform plan


terraform apply --auto-approve
rem terraform apply --auto-approve