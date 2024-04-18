resource "aws_instance" "web1" {
  ami           = "ami-05c969369880fa2c2"  # Ubuntu 18.04 LTS AMI ID
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public1.id    # Using public subnet 1

  key_name = var.key_pair_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]  # Assuming you have a security group allowing SSH

  iam_instance_profile = aws_iam_instance_profile.example_instance_profile.name  # Using the IAM instance profile created earlier

  associate_public_ip_address = true  # Automatically enables IPv4 public addressing

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y aws-ssm-agent
              EOF

  tags = {
    Name = "WebServer1"
  }

  provisioner "file" {
    source      = "privatekey.pem"  # Path to your private key file
    destination = "/home/ec2-user/privatekey.pem"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("privatekey.pem")  # Path to your private key file
    host        = aws_instance.web1.public_ip
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-05c969369880fa2c2"  # Update to a valid AMI ID
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public2.id

  key_name = var.key_pair_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  iam_instance_profile   = aws_iam_instance_profile.example_instance_profile.name
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y aws-ssm-agent
    EOF

  tags = {
    Name = "WebServer2"
  }

  provisioner "file" {
    source      = "privatekey.pem"
    destination = "/home/ec2-user/privatekey.pem"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("privatekey.pem")
    host        = aws_instance.web2.public_ip
  }
}
