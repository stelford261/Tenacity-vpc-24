
resource "aws_route_table" "prod-pub-route-table" {
  vpc_id = aws_vpc.tenacity_vpc.id
  tags = {
    Name = "prod-pub-route-table"
  }
}

resource "aws_route_table" "prod-priv-route-table" {
  vpc_id = aws_vpc.tenacity_vpc.id
  tags = {
    Name = "prod-priv-route-table"
  }
}

resource "aws_route_table_association" "public-association-1" {
  subnet_id      = aws_subnet.prod-pub-sub1.id
  route_table_id = aws_route_table.prod-pub-route-table.id
}

resource "aws_route_table_association" "public-association-2" {
  subnet_id      = aws_subnet.prod-pub-sub2.id
  route_table_id = aws_route_table.prod-pub-route-table.id
}

resource "aws_route_table_association" "private-association-1" {
  subnet_id      = aws_subnet.prod-priv-sub1.id
  route_table_id = aws_route_table.prod-priv-route-table.id
}

resource "aws_route_table_association" "private-association-2" {
  subnet_id      = aws_subnet.prod-priv-sub2.id
  route_table_id = aws_route_table.prod-priv-route-table.id
}