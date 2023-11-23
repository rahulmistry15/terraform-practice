terraform {
required_providers {
	aws = {
	source = "hashicorp/aws"
	version = "~> 4.16"
}
}
	required_version = ">= 1.2.0"
}

provider "aws" {
region = "ap-south-1"
}

locals {
        instances = {"Rahul":"ami-0287a05f0ef0e9d9a","Mistry":"ami-064607abed305477a","DevOps":"ami-0645cf88151eb2007","Engineer":"ami-0287a05f0ef0e9d9a"}
}

resource "aws_instance" "aws_ec2_test" {
	for_each = local.instances
	ami = each.value
	instance_type = "t2.micro"
	tags = {
        Name = each.key
}
}
