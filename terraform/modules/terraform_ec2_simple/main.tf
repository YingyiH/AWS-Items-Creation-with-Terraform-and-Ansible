
# Get the most recent ami for Ubuntu 22.04
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-lunar-23.04-amd64-server-*"]
  }
}

# Define EC2 module with default varaible values
resource "aws_instance" "ec2_instance" {
  count                       = var.instance_count
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  availability_zone           = var.availability_zones[count.index]
  subnet_id                   = var.subnet_ids[count.index]
  security_groups             = var.security_groups
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name_tag
  }
}
