resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/25"
  availability_zone = "ca-central-1a"
  tags = {
    Name = "subnet"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.128/25"
  availability_zone = "ca-central-1b"
  tags = {
    Name = "subnet2"
  }
}


resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.vpc.id

  route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.IGW.id
    }
}


resource "aws_route_table_association" "RT1" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.RT.id
}
resource "aws_route_table_association" "RT2" {
   subnet_id      = aws_subnet.subnet2.id
   route_table_id = aws_route_table.RT.id
}

