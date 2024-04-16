# availability zone variable  us-west-1, ap-southeast-1
variable "zones" {
  type    = list(string)
  default = ["us-west-1", "ap-southeast-1", ]
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "terraform-key-pair"
}

variable "ami_name" {
  type    = string
  default = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}

variable "ami_owner" {
  type    = list(string)
  default = ["amazon", "099720109477"]
}