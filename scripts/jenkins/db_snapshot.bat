@echo off
terraform init
terraform plan
rem terraform apply --auto-approve
terraform apply -var="snapshot_date=2025-06-15" --auto-approve