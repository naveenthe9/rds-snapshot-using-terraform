@echo off
set TF_VAR_snapshot_date=%5
echo %TF_VAR_snapshot_date%
echo %5 > file.txt
terraform init
terraform plan


rem terraform apply --auto-approve