@echo off
rem terraform init
rem terraform plan
set TF_VAR_snapshot_date=%5
echo %5, > file.txt

rem terraform apply --auto-approve
rem terraform apply --auto-approve