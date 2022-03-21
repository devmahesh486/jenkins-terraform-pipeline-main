resource "aws_vpc" "demo-rspl" {
  cidr_block       = "70.70.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "DEMO-RSPL"
  }
}
resource "aws_subnet" "demo1" {
  vpc_id     = aws_vpc.demo-rspl.id
  cidr_block = "70.70.1.0/28"

  tags = {
    Name = "RSPL-SUBNET1"
  }
}
resource "aws_subnet" "demo2" {
  vpc_id     = aws_vpc.demo-rspl.id
  cidr_block = "70.70.1.16/28"

  tags = {
    Name = "RSPL-SUBNET2"
  }
}
resource "aws_internet_gateway" "massgw" {
  vpc_id = aws_vpc.demo-rspl.id

  tags = {
    Name = "MASS"
  }
}
resource "aws_route_table" "Pu_RT" {
  vpc_id = aws_vpc.demo-rspl.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.massgw.id
  }

  tags = {
    Name = "MASSIAN"
  }
}
resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.demo-rspl.id
  }
