variable "ami_for_ec2_instance" {
    description = "AMI ID for the EC2 instance"
    type = string
}

variable "aws_region" {
    description = "AWS region for the instance"
    type = string
}

variable "instance_type" {
    description = "instnace type for the instance"
    type = string
}