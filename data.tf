provider "aws" {
 access_key 					= "${var.access_key}"
  secret_key 					= "${var.secret_key}"
  region     					= "${var.region}"
}

data "aws_ami" "latest" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
    
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"]
}

output "latest_ami_name" {
  value = "${data.aws_ami.latest.name}"
}

output "latest_ami_id" {
  value = "${data.aws_ami.latest.id}"
}