data "aws_vpc" "default" {
    default = true
}

resource "aws_vpc_ipv4_cidr_block_association" "additional" {
    vpc_id = data.aws_vpc.default.id
    cidr_block = "172.30.0.0/16"
}
resource "aws_subnet" "public" {
    vpc_id = data.aws_vpc.default.id
    cidr_block = "172.30.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    depends_on = [aws_vpc_ipv4_cidr_block_association.additional]
    tags = {
        Name = "public_subnet_created_at_terraform"
    }
}
resource "aws_subnet" "private" {
    vpc_id = data.aws_vpc.default.id
    cidr_block = "172.30.11.0/24"
    availability_zone = "us-east-1a"
    depends_on = [aws_vpc_ipv4_cidr_block_association.additional]
    tags = {
        Name = "private_subnet_created_at_terraform"
    }
}
resource "aws_subnet" "private_az2" {
    vpc_id = data.aws_vpc.default.id
    cidr_block = "172.30.12.0/24"
    availability_zone = "us-east-1b"
    depends_on = [aws_vpc_ipv4_cidr_block_association.additional]
    tags = {
        Name = "private_subnet_az2_created_at_terraform"
    }
}

resource "aws_db_subnet_group" "private" {
    name = "aurora-private-subnet-group"
    subnet_ids = [aws_subnet.private.id, aws_subnet.private_az2.id]
    tags = {
        Name = "aurora-private-subnet-group"
    }
}