data "aws_internet_gateway" "default" {
    filter {
        name = "attachment.vpc-id"
        values = [data.aws_vpc.default.id]
    }
}

resource "aws_route_table" "public" {
  vpc_id = data.aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.default.id
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
resource "aws_route_table_association" "private_az2_assoc" {
  subnet_id = aws_subnet.private_az2.id
  route_table_id = aws_route_table.private.id
}
