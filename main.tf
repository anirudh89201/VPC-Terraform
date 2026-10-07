module "network" {
    source = "./modules"
    ami_for_ec2_instance = var.ami_for_ec2_instance
    instance_type = var.instance_type
    aws_region = var.aws_region
    instace_AZ = var.instace_AZ
}