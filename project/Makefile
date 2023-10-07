california:
    terraform workspace new california || terraform workspace select california
    terraform init
    terraform apply -var-file regions/california.tfvars --auto-approve
california-destroy:
    terraform workspace new california || terraform workspace select california
    terraform init
    terraform destroy -var-file regions/california.tfvars --auto-approve
ohio:
    terraform workspace new ohio || terraform workspace select ohio
    terraform init
    terraform apply -var-file regions/ohio.tfvars --auto-approve
ohio-destroy:
    terraform workspace new ohio || terraform workspace select ohio
    terraform init
    terraform destroy -var-file regions/ohio.tfvars --auto-approve