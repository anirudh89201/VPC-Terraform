resource "aws_instance" "EC2_instance"{
    ami =  var.ami_for_ec2_instance
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
    security_groups = [aws_security_group.EC2_SecurityGroup.name]
    associate_public_ip_address = true
    tags = {
        Name = "public-ec2-instance"
    }
}