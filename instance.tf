data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}
resource "aws_instance" "instance" {
  ami           = data.aws_ami.amazon_linux_2.id 
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.SG.id]
  key_name = "cloud_itm_canada"
  associate_public_ip_address = "true"
  user_data = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo amazon-linux-extras install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo docker run -p 80:80 httpd
  EOF
  tags = {
    Name = "${var.files_name}"
  }

}

resource "aws_instance" "instance2" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.SG.id]
  key_name = "cloud_itm_canada"
  associate_public_ip_address = "true"
  user_data = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo amazon-linux-extras install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo docker run -p 80:80 httpd
  EOF
  tags = {
    Name = "${var.files_name}"
  }

}




