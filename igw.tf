resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.tenacity_vpc.id
  tags = {
    Name = "prod-igw"
  }
}

resource "aws_route" "Pub-igw-route" {
  route_table_id            = aws_route_table.prod-pub-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.prod-igw.id
}  

resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "NAT-EIP"
  }
}

resource "aws_nat_gateway" "Prod-Nat-gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.prod-pub-sub1.id
  tags = {
    Name = "Prod-Nat-gateway"
  }
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.prod-priv-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.Prod-Nat-gateway.id
}
