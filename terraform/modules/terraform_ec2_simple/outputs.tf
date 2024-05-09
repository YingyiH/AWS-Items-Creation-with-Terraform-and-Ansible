# Output EC2 instance IDs
output "ec2_instance_id" {
    value = [for instance in aws_instance.ec2_instance : instance.id]
}

# Output EC2 instance public IP addresses
output "ec2_instance_public_ip" {
    value = [for instance in aws_instance.ec2_instance : instance.public_ip]
}
