# Output EC2 instance IDs
output "ec2_instance_id" {
    value = module.ec2.ec2_instance_id
}

# Output EC2 instance public IP addresses
output "ec2_instance_public_ip" {
    value = module.ec2.ec2_instance_public_ip
}

# Output VPC ID
output "vpc_id" {
  value = aws_vpc.assignment2_main_vpc.id
}

# Output Internet gateway ID
output "igw" {
  value = aws_internet_gateway.assignment2_igw.id
}

# Output route table ID
output "rt" {
  value = aws_route_table.assignment2_rt.id
}

# Output security group ID
output "sg" {
  value = [aws_security_group.assignment2_sg.id]
}