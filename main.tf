terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_ec2_managed_prefix_list" "test" {
    name = "test-pl"
    address_family = "IPv4"
    max_entries = 5 
}

resource "aws_ec2_managed_prefix_list_entry" "test" {
    prefix_list_id = aws_ec2_managed_prefix_list.test.id
    for_each = toset(var.entries)
    cidr = each.key
}

resource "aws_security_group" "webports" {
    name = "webaccess2"
    description = "Allow traffic on port 4000/tcp"
    vpc_id = var.webvpc
    ingress {
        description = "port 4000 ingress"
        from_port   = 4000
        to_port     = 4000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "deadend"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["127.0.0.1/32"]
    }
    tags = {
        Name = "webaccess"
    }
}