resource "aws_key_pair" "my_key_pair" {
  count = var.create_key_pair ? 1 : 0  # Conditionally create the key pair based on the variable

  key_name   = "my-key-pair"  # Change to your desired key pair name
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key file
}
