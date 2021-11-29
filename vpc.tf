provider "aws" {
  region = "ca-central-1"
}
variable "files_name" {
	default = "cloudstge"
}
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.files_name}"
  }
}


