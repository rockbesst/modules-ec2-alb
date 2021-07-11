resource "aws_instance" "ec2" {
	ami = data.aws_ami.amazon_linux.id
	instance_type = var.instance_type
	availability_zone = var.avail_zone
	vpc_security_group_ids = var.sec_group_id
	user_data = file("ready_webserver.sh")
	key_name = var.ssh_key
	associate_public_ip_address = var.allow_public_ip
	tags = merge(var.tags, {Name = "WebServer1"})
}

data "aws_ami" "amazon_linux" {
	owners = ["amazon"]
	most_recent = true
	filter {
		name = "name"
		values = ["amzn2-ami-hvm-*-x86_64-gp2"]
	}
}