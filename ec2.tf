resource "aws_instance" "web1" {
  ami           = "ami-0c55b159cbfafe1f0"  # Ubuntu 18.04 LTS AMI ID
  instance_type = "t2.large"
  subnet_id     = aws_subnet.public1.id    # Using public subnet 1

  key_name = local.key_pair_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]  # Assuming you have a security group allowing SSH

  iam_instance_profile = aws_iam_role.example_role.name  # Assuming you have created an IAM role as described in the previous response

  associate_public_ip_address = true  # Automatically enables IPv4 public addressing

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y aws-ssm-agent
              EOF

  tags = {
    Name = "WebServer1"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-0c55b159cbfafe1f0"  # Ubuntu 18.04 LTS AMI ID
  instance_type = "t2.large"
  subnet_id     = aws_subnet.public2.id    # Using public subnet 2

  key_name = local.key_pair_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]  # Assuming you have a security group allowing SSH

  iam_instance_profile = aws_iam_role.example_role.name  # Assuming you have created an IAM role as described in the previous response

  associate_public_ip_address = true  # Automatically enables IPv4 public addressing

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y aws-ssm-agent
              EOF

  tags = {
    Name = "WebServer2"
  }
}
