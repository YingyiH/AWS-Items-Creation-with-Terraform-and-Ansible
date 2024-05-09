# AWS-Items-Creation-with-Terraform-and-Ansible
This is a project to create AWS EC2, VPC, Security Group and other items with Terraform and Ansible.

## Author
Yingyi

## Video Description
https://www.youtube.com/watch?v=-aFTTkhjqyE

## Step 1: Create Terraform folder and Ansible folder
Create two folders:
- /terraform/
- /ansible/

## Step 2: Create local SSH key
```
aws ec2 create-key-pair \
--key-name yhe-assignment2 \
--key-type ed25519 \
--key-format pem \
--query "KeyMaterial" \
--output text > yhe-assignment2.pem
```

## Step 3: Create Terraform module for EC2
1. Create ec2 module folder: 
  Create `terraform_ec2_simple` module into main `modules` folder
2. Create tf files:
  - Create`main.tf` in `terraform_ec2_simple` module folder
  - Create `outputs.tf` `terraform_ec2_simple` module folder
  - Create `variables.tf` `terraform_ec2_simple` module folder

## Step 4: Create tf files in main module
Separate tf files for different functionalities
    - `main.tf` to call EC2 module and create local file for Ansible inventory yaml file
    - `provider.tf` for Terraform provider
    - `aws_vpc.tf` for vpc, subnets, and route table
    - `aws_sg.tf` for security group
    - `outputs.tf` for Terraform output
    - `variables.tf` to define variables

## Step 5: Run Terraform Commands for Terraform configuration
- `terranform init`: to initialize my work directory
- `terraform validate`: to validate my configuration file
- `terraform plan`: to generation a execution plan
- `terraform apply`: to apply my plan file
- `terraform output`: to output items which set up in `outputs.tf`

## Step 6: Download application repository
Use `git clone` to download the application repository in ubuntu VM

## Step 7: Create Ansible playbook yaml file
1. Define target hosts, target users, and permissions
2. Define variables for script
3. Using ansbile built-in module to configure target hosts:
  - `ansible.builtin.apt`: update and download packages
  - `ansible.builtin.get_url`: download files by executing URL
  - `ansible.builtin.shell`: run command lines in shell
  - `ansible.builtin.user`: create user
  - `ansible.builtin.copy`: copy files with given source and destination locations
  - `ansible.builtin.stat`: check facts
  - `ansible.builtin.systemd`: enable, start, stop, restart, or reload services in systemd
  - `ansible.builtin.service`: enable, start, stop, restart, or reload services


## Step 8: Run Ansible Commandsfor Ansible configuration
- `ansible-playbook playbook.yml`: to run Ansible playbook yaml file with ansible configuration set up
- `ansible-playbook -i inventory.yml playbook.yml`: to run Ansible playbook yaml file with inventory yaml configuration set up
- `ansible-lint playbook.yml`: to analyze the code in Ansible playbook yaml file for its errors and issues
- `ansible-inventory --graph`: to create inventory graph, if supplying pattern it must be a valid group name
- `ansible-inventory --list`: display the inventory information with JSON format

## References:
- About Terraform Modules
    - https://developer.hashicorp.com/terraform/language/modules
    - https://developer.hashicorp.com/terraform/language/modules/develop
    - https://spacelift.io/blog/what-are-terraform-modules-and-how-do-they-work
    - https://registry.terraform.io/namespaces/terraform-aws-modules

- About Ansible
    - https://www.redhat.com/en/topics/automation/learning-ansible-tutorial
    - https://docs.ansible.com/ansible/latest/inventory_guide/connection_details.html
    - https://docs.ansible.com/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html

- About Ansible Inventory
    - https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html
    - https://medium.com/@rajeshshukla_49087/ansible-inventory-file-using-terraform-b305db3ead2

- About Ansible Playbook
    - https://gitlab.com/cit_4640/4640_notes_w24/-/blob/main/4640_Notes/Week8.md?ref_type=heads
    - https://www.redhat.com/sysadmin/deconstructing-ansible-playbook
    - https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html#playbook-keywords
    - https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html
    - https://docs.ansible.com/ansible/latest/collections/ansible/builtin/get_url_module.html#ansible-collections-ansible-builtin-get-url-module
    - https://docs.ansible.com/ansible/latest/collections/ansible/builtin/command_module.html#ansible-collections-ansible-builtin-command-module
    - https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html#ansible-collections-ansible-builtin-user-module
    - https://docs.ansible.com/ansible/latest/collections/ansible/builtin/service_module.html

- About Ansible Configuration
    - https://docs.ansible.com/ansible/latest/installation_guide/intro_configuration.html
    - https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings
