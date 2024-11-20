# Variables
TERRAFORM_DIR := infra/terraform 
DOCKER_IMAGE := terraform-image  
TERRAFORM_WORKSPACE := /workspace 

# Terraform tasks
init:
	cd $(TERRAFORM_DIR) && terraform init

validate:
	cd $(TERRAFORM_DIR) && terraform validate

plan:
	cd $(TERRAFORM_DIR) && terraform plan -out=tfplan

apply:
	cd $(TERRAFORM_DIR) && terraform apply "tfplan"

destroy:
	cd $(TERRAFORM_DIR) && terraform destroy -auto-approve

# Docker tasks
build:
	docker build -t $(DOCKER_IMAGE) .

terraform-init:
	docker run --rm -v $(PWD)/infra/terraform:$(TERRAFORM_WORKSPACE) $(DOCKER_IMAGE) init

terraform-validate:
	docker run --rm -v $(PWD)/infra/terraform:$(TERRAFORM_WORKSPACE) $(DOCKER_IMAGE) validate

terraform-plan:
	docker run --rm -v $(PWD)/infra/terraform:$(TERRAFORM_WORKSPACE) $(DOCKER_IMAGE) plan -out=tfplan

terraform-apply:
	docker run --rm -v $(PWD)/infra/terraform:$(TERRAFORM_WORKSPACE) $(DOCKER_IMAGE) apply tfplan

terraform-destroy:
	docker run --rm -v $(PWD)/infra/terraform:$(TERRAFORM_WORKSPACE) $(DOCKER_IMAGE) destroy -auto-approve

# Clean up Terraform and Docker files
clean:
	rm -rf infra/terraform/.terraform infra/terraform/.terraform.lock.hcl infra/terraform/tfplan
	docker rmi $(DOCKER_IMAGE) 
