@echo off
cd ../terraform/
cd
echo %cd%
set TF_VAR_snapshot_date=%5
echo %TF_VAR_snapshot_date%
set AWS_PROFILE=default
echo %5 > file.txt
terraform init
terraform plan
terraform apply --auto-approve