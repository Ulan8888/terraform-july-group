resource "aws_vpc" "group-Number" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "group-Number"
  }
}

        # Subnets
resource "aws_subnet" "group-Number1" {
  vpc_id     = aws_vpc.group-Number.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true


  tags = {
    Name = "group-Number1"
  }
}

resource "aws_subnet" "group-Number2" {
  vpc_id     = aws_vpc.group-Number.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true


  tags = {
    Name = "group-Number2"
  }
}

resource "aws_subnet" "group-Number3" {
  vpc_id     = aws_vpc.group-Number.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true


  tags = {
    Name = "group-Number3"
  }
}

# Internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.group-Number.id

  tags = {
    Name = "group-Number"
  }
}

# Route Tables 

resource "aws_route_table" "group-Number" {
  vpc_id = aws_vpc.group-Number.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "group-Number"
  }
}


   #  subnet associations.


resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.group-Number1.id
  route_table_id = aws_route_table.group-Number.id
}

resource "aws_route_table_association" "b1" {
  subnet_id      = aws_subnet.group-Number2.id
  route_table_id = aws_route_table.group-Number.id
}

resource "aws_route_table_association" "c1" {
  subnet_id      = aws_subnet.group-Number3.id
  route_table_id = aws_route_table.group-Number.id
}

