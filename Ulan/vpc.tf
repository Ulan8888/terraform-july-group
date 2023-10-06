# resource "aws_vpc" "group2" {
#   cidr_block       = "10.0.0.0/16"

#   tags = {
#     Name = "group-Number"
#   }
# }

#         # Subnets
# resource "aws_subnet" "subnet1" {
#   vpc_id     = aws_vpc.group2.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "us-east-1a"
#   map_public_ip_on_launch = true


#   tags = {
#     Name = "group-Number1"
#   }
# }

# resource "aws_subnet" "subnet2" {
#   vpc_id     = aws_vpc.group2.id
#   cidr_block = "10.0.2.0/24"
#   availability_zone = "us-east-1b"
#   map_public_ip_on_launch = true


#   tags = {
#     Name = "group-Number2"
#   }
# }

# resource "aws_subnet" "subnet3" {
#   vpc_id     = aws_vpc.group2.id
#   cidr_block = "10.0.3.0/24"
#   availability_zone = "us-east-1c"
#   map_public_ip_on_launch = true


#   tags = {
#     Name = "group-Number3"
#   }
# }

# # Internet gateway

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.group2.id

#   tags = {
#     Name = "group2"
#   }
# }

# # Route Tables 

# resource "aws_route_table" "group2" {
#   vpc_id = aws_vpc.group2.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = "group-Number"
#   }
# }


#    #  subnet associations.


# resource "aws_route_table_association" "1a" {
#   subnet_id      = aws_subnet.subnet1.id
#   route_table_id = aws_route_table.group2.id
# }

# resource "aws_route_table_association" "1b" {
#   subnet_id      = aws_subnet.subnet2.id
#   route_table_id = aws_route_table.group2.id
# }

# resource "aws_route_table_association" "1c" {
#   subnet_id      = aws_subnet.subnet3.id
#   route_table_id = aws_route_table.group2.id
# }

