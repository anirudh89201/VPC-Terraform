data "aws_vpc" "default" {
    default =  true
}
resource "aws_subnet" "public" {
    vpc_id = data.aws_vpc.default.id
    cidr_block = "172.31.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "public_subnet_created_at_terraform"
    }
}
resource "aws_subnet" "private" {
    vpc_id = data.aws_vpc.default.id
    cidr_block = "172.31.2.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "private_subnet_created_at_terraform"
    }
}