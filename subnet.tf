resource "aws_vpc" "tenacity_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Tenacity-VPC"
  }
}
resource "aws_subnet" "prod-pub-sub1" {
  vpc_id                  = aws_vpc.tenacity_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"
  tags = {
    Name = "prod-pub-sub1"
  }
}

resource "aws_subnet" "prod-pub-sub2" {
  vpc_id                  = aws_vpc.tenacity_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2b"
  tags = {
    Name = "prod-pub-sub2"
  }
}

resource "aws_subnet" "prod-priv-sub1" {
  vpc_id                  = aws_vpc.tenacity_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"
  tags = {
    Name = "prod-priv-sub1"
  }
}

resource "aws_subnet" "prod-priv-sub2" {
  vpc_id                  = aws_vpc.tenacity_vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2b"
  tags = {
    Name = "prod-priv-sub2"
  }
}