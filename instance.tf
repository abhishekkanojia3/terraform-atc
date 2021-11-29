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
    sudo su
    mkdir /home/ec2-user/testing
    cd /home/ec2-user/testing 
    wget https://univr.s3.ap-south-1.amazonaws.com/build.zip
    wget https://univr.s3.ap-south-1.amazonaws.com/Dockerfile
    unzip build.zip
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    usermod -a -G docker ec2-user
    docker build -t my-apache2 .
    docker run -dit --name my-running-app -p 80:80 my-apache2
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
    sudo su
    mkdir /home/ec2-user/testing
    cd /home/ec2-user/testing 
    wget https://univr.s3.ap-south-1.amazonaws.com/build.zip
    wget https://univr.s3.ap-south-1.amazonaws.com/Dockerfile
    unzip build.zip
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    usermod -a -G docker ec2-user
    docker build -t my-apache2 .
    docker run -dit --name my-running-app -p 80:80 my-apache2
  EOF
  tags = {
    Name = "${var.files_name}"
  }

}
