provider "aws" {
    region = "eu-central-1"
}

data "aws_vpc" "mainVPC" {}
data "aws_subnet" "sub1"{
	 id = "subnet-0c95ec66"
 }

data "aws_subnet" "sub2"{
	 id = "subnet-ad3c88d1"
 }

module "ec2" {
    source = "./ec2"
    count = 2
    avail_zone = ""
    sec_group_id = module.sec_group.asg_id
}

module "sec_group" {
    source = "./sg"
    vpc_id = data.aws_vpc.mainVPC.id
}

module "alb" {
    source = "./alb"
    asg_id = module.sec_group.asg_id
    subnet_id = ""
    vpc_id = data.aws_vpc.mainVPC.id
    ec2_id = module.ec2.ec2_id
}