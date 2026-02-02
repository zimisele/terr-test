terraform {
  backend "s3" {
    bucket = "mys3-prac-demos"
    key    = "demo/terraform-state-file"
    region = "eu-west-1"
  }
}

terraform {
  required_providers {
    aws = {
    source = "hashicorp/aws"
    version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "github" {
  ami = "ami-03446a3af42c5e74e"
  instance_type = "m5.large"
  subnet_id = "subnet-0c061f458755eddff"
  vpc_security_group_ids = [ "sg-034e2601c3c1c1b23" ]
  tags = {
    Name = "github-test"
    Env = "Dev"
  }
}