# Terraform WordPress Deployment on ECS

This repository contains Terraform configuration files that deploy a fully functional WordPress site on AWS using EC2 and RDS.

## Requirements

- Terraform 0.12 or later
- AWS account and credentials configured on your local machine
- Access to the internet to download the WordPress image

## Usage

1. Clone this repository

`git clone https://github.com/Oleh-Hudzp/terraform-wordpress-ecs.git`

2. Change into the repository directory

`cd terraform-wordpress-deployment`

3. Create a `terraform.tfvars` file and set the following variables:

`access_key = "YOUR_AWS_ACCESS_KEY"`

`secret_key = "YOUR_AWS_SECRET_KEY"`

`region = "YOUR_AWS_REGION"`

`db_user = "YOUR_DB_USERNAME"`

`db_password = "YOUR_DB_PASSWORD"`

`container_name = "YOUR_CONTAINER_NAME"`

4. Initialize Terraform

`terraform init`

5. Review the Terraform plan

`terraform plan`

6. Apply the Terraform configuration

`terraform apply`

7. Verify the WordPress site is running by visiting the load balancer's DNS address in a web browser

8. When you are done, you can destroy the infrastructure by running

`terraform destroy`


## Configuration

The `main.tf` file contains the Terraform configuration for creating the following resources on AWS:

- VPC
- Subnets
- Internet Gateway
- Route Tables
- Security Groups
- RDS MySQL instance
- EC2 instance
- Elastic Load Balancer
- Auto Scaling Group

## Outputs

The following outputs are exported by the Terraform configuration:

- `elb_dns_name`: The DNS name of the Elastic Load Balancer

## Limitations

- This configuration only creates a single EC2 instance and a single RDS instance.

- This configuration only supports MySQL as the database engine.

- This configuration is not suitable for production use, as it does not include any backups or high availability features.

- This configuration is intended for demonstration and learning purposes only.
