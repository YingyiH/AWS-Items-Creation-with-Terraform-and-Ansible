# Create a VPC
resource "aws_vpc" "assignment2_main_vpc" {
    cidr_block       = var.vpc_CIDR_block
    instance_tenancy = "default"

    tags = {
        Name = "assignment2-vpc"
    }
}

# Create public subnets
resource "aws_subnet" "assignment2_subnet"{
    count                   = 2
    vpc_id                  = aws_vpc.assignment2_main_vpc.id
    cidr_block              = var.subnet_CIDR[count.index]
    availability_zone       = var.availability_zones[count.index]
    map_public_ip_on_launch = true
    
    tags = {
        Name    = "assignment2-subnets"
        Project = var.project_name
    }
}

# Create a gateway
resource "aws_internet_gateway" "assignment2_igw" {
    vpc_id = aws_vpc.assignment2_main_vpc.id

    tags = {
        Name = "assignment2-igw"
    }
}

# Create a route table
resource "aws_route_table" "assignment2_rt" {
    vpc_id = aws_vpc.assignment2_main_vpc.id

    route {
        cidr_block = var.default_route
        gateway_id = aws_internet_gateway.assignment2_igw.id
    }
    tags = {
        Name = "assignment2-route-table"
    }
}

# Create route table associate
resource "aws_route_table_association" "assignment2_rt_association" {
    count          = 2
    subnet_id      = aws_subnet.assignment2_subnet[count.index].id
    route_table_id = aws_route_table.assignment2_rt.id
}