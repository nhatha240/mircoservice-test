data "aws_ami" "example" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "^ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  owners           = var.ami_owner

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}