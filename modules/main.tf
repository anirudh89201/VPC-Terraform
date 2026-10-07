resource "aws_instance" "EC2_instance"{
    ami =  var.ami_for_ec2_instance
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
    availability_zone = var.instace_AZ
    vpc_security_group_ids = [aws_security_group.EC2_SecurityGroup.id]
    associate_public_ip_address = true
    tags = {
        Name = "public-ec2-instance"
    }
}

resource "aws_rds_cluster" "rds_cluster" {
    cluster_identifier = "aurora-cluster-demo"
    engine = "aurora-postgresql"
    database_name = "mydb"
    master_username = "dbadmin"
    manage_master_user_password = true
    db_subnet_group_name = aws_db_subnet_group.private.name
    vpc_security_group_ids = [aws_security_group.db_security_group.id]
    storage_encrypted = true
    skip_final_snapshot = true
}
resource "aws_rds_cluster_instance" "writer" {
    identifier = "aurora-cluster-instance-1"
    cluster_identifier = aws_rds_cluster.rds_cluster.id
    engine = aws_rds_cluster.rds_cluster.engine
    instance_class = "db.r6g.large"
    publicly_accessible = false
}