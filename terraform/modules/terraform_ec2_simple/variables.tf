# Define project name description
variable "project_name" {
    description = "Project name"
}

# Define instance count description, type, and default value
variable "instance_count" {
    description = "a count of default"
    type = number
    default = 2
}

# Define instance type description and default value
variable "instance_type" {
    description = "AWS EC2 instance type"
    default = "t2.micro"
}

# Define availability zones description and default value
variable "availability_zones" {
    description = "AWS Availability zones in us-west-2"
    default = ["us-west-2a","us-west-2b"]
}

# Define instance name tag description and default value
variable "instance_name_tag" {
    description = "AWS EC2 instance name tag"
    default = "4640-Assignment-2-instance"
}

# Define subnet id description
variable "subnet_ids" {
    description = "The subnet to launch the instance"
}

# Define security group description
variable "security_groups" {
    description = "The security groups to launch the instance"
}

# Define VPC description
variable "vpc_id" {
    description = "The vpc to launch the instance"
}

# Define ssh key variable description
variable "key_name" {
    description = "The SSH key to launch the instance"
}
 

