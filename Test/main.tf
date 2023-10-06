provider aws {
    region=var.aws_region
}

resource "aws_vpc" "group2" {
  cidr_block   = var.vpc_cidr_block
}
        # Subnets
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.group2.id
  cidr_block =var.subnet1_cidr_block
  availability_zone = var.az1
  map_public_ip_on_launch=var.map_public_ip_on_launch
  tags = {
    Name = "subnet1"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.group2.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.az2
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "subnet2"
  }
}
resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.group2.id
  cidr_block = "10.0.3.0/24"
  availability_zone = var.az3
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "subnet3"
  }
}
# Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.group2.id
  tags = {
    Name = "group2"
  }
}
# Route Tables
resource "aws_route_table" "group2" {
  vpc_id = aws_vpc.group2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "group2"
  }
}
   #  subnet associations.
resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.group2.id
}
resource "aws_route_table_association" "b1" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.group2.id
}
resource "aws_route_table_association" "c1" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.group2.id
}

#security group

resource "aws_security_group" "allow_tls" {
  name        = "group2"
  description = "Allow TLS inbound traffic"
  vpc_id =  aws_vpc.group2.id
  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
tags = {
  Name =  "group2"
}
}



#ec2
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}