terraform {
    required_providers {
      aws = "~>5.0.0"
    }
    
    backend "s3" {
        region = "us-east-1"
        bucket = "terraform-state-bucket-us-east-1-12354"
        key = "prod/terraform.tfstate"
        use_lockfile = true
    }   
}
provider "aws" {
  region = "us-east-1"
}
