resource "aws_internet_gateway" "igw" {
    vpc_id = data.aws_vpc.default.id
    tags = {
        Name = "igw-created-by-terraform"
    }
}

resource "aws_route_table" "public" {
  vpc_id = data.aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}
resource "aws_route_table_association" "public_assoc" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
    vpc_id = data.aws_vpc.default.id
    tags = {
        Name = "private-route-table"
    }
}
resource "aws_route_table_association" "private_assoc"{
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
}
