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
    for_each = var.entries
    cidr = each.value
    description = each.key
}

