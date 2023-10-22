init:
    terraform init

plan:
    terraform plan -var-file=./dev.tfvars

deploy:
    terraform apply -var-file=./dev.tfvars -auto-approve

destroy:
    terraform destroy -var-file=./dev.tfvars -auto-approve