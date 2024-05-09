# Define project name description and default value
variable "project_name" {
    description = "Project name"
    default = "assignment-2"
}

# Define region description and default value
variable "aws_region" {
    description = "AWS region"
    default = "us-west-2"
}

# Define availability zone description and default value
variable "availability_zones" {
    description = "AWS Availability zones in us-west-2"
    default = ["us-west-2a","us-west-2b"]
}

# Define CIDR block for VPC
variable "vpc_CIDR_block" {
  description = "default cidr block for vpc"
  default     = "10.0.0.0/16"
}

# Define CIDR blocks for subnets
variable "subnet_CIDR" {
    description = "The subnet to launch the instance on"
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "default_route"{
  description = "Default route"
  default     = "0.0.0.0/0"
}

# Define ssh key variable description and default value
variable "key_name" {
    description = "The SSH key to launch the instance"
    default = "yhe-assignment2"
}
