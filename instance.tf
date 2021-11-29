resource "aws_instance" "instance" {
  ami           = "ami-0d8ad3ab25e7abc51" # us-west-2
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.SG.id]
  key_name = "cloud_itm"
  associate_public_ip_address = "true"
  provisioner "local-exec" {

    command = "echo ${aws_instance.instance.public_ip} >> ${var.files_name}"
  }
  tags = {
    Name = "${var.files_name}"
  }

}

resource "aws_instance" "instance2" {
  ami           = "ami-0d8ad3ab25e7abc51" # us-west-2
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.SG.id]
  key_name = "cloud_itm"
  associate_public_ip_address = "true"
  provisioner "local-exec" {

    command = "echo ${aws_instance.instance2.public_ip} >> ${var.files_name}"
  }
  tags = {
    Name = "${var.files_name}"
  }

}




