resource "aws_security_group" "db_security_group" {
    name = "rds-private-sg"
    description = "Allow PostgreSQL access from the EC2 security group"
    vpc_id = data.aws_vpc.default.id

    ingress {
        description = "PostgreSQL from EC2"
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        security_groups = [aws_security_group.EC2_SecurityGroup.id]
    }
    tags = {
        Name = "rds-private-sg"
    }
}