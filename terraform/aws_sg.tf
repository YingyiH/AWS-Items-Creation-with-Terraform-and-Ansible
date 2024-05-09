# Create a security group for public instances
resource "aws_security_group" "assignment2_sg" {
    name        = "assignment2-sg"
    description = "Allow http,ssh, port 5000 access to ec2 from home and bcit"
    vpc_id      = aws_vpc.assignment2_main_vpc.id

    tags = {
        Name = "assignment2-sg"
    }
}

# Create security group egress rules
resource "aws_vpc_security_group_egress_rule" "main_public_egress" {
    security_group_id = aws_security_group.assignment2_sg.id

    cidr_ipv4   = "0.0.0.0/0"
    ip_protocol = "-1"
}

# Create security group ingress SSH rules
resource "aws_vpc_security_group_ingress_rule" "allow_public_ssh" {
    security_group_id = aws_security_group.assignment2_sg.id

    cidr_ipv4         = "0.0.0.0/0"
    from_port         = 22
    ip_protocol       = "tcp"
    to_port           = 22

}

# Create security group ingress HTTP rules
resource "aws_vpc_security_group_ingress_rule" "allow_public_http" {
    security_group_id = aws_security_group.assignment2_sg.id

    cidr_ipv4         = "0.0.0.0/0"
    from_port         = 80
    ip_protocol       = "tcp"
    to_port           = 80
}