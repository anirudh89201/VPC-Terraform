resource "aws_security_group" "EC2_SecurityGroup" {
    name = "public-sg"
    description = "Allow SSH and HTTP"
    vpc_id = data.aws_vpc.default.id
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["49.205.201.230/32"]
    }
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    tags = {
        Name = "public-sg"
    }
}