# Call EC2 module
module "ec2" {
  source = "./modules/terraform_ec2_simple"
  project_name = var.project_name
  subnet_ids = aws_subnet.assignment2_subnet[*].id
  security_groups = [aws_security_group.assignment2_sg.id]
  vpc_id = aws_vpc.assignment2_main_vpc.id
  key_name = var.key_name
}

# Create Ansible inventory file automatically
resource "local_file" "ansible_inventory" {
 filename = "../ansible/ansible_inventory.aws_ec2.yml"

 content = <<EOF
  ec2_instances:
    hosts:
        ${module.ec2.ec2_instance_public_ip[0]}:
          ansible_host: ${module.ec2.ec2_instance_public_ip[0]}
          ansible_user: ubuntu
          ansible_ssh_private_key_file: ../yhe-assignment2.pem
        ${module.ec2.ec2_instance_public_ip[1]}:
          ansible_host: ${module.ec2.ec2_instance_public_ip[1]}
          ansible_user: ubuntu
          ansible_ssh_private_key_file: ../yhe-assignment2.pem
    EOF
}
