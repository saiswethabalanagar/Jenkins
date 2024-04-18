resource "aws_key_pair" "my_key_pair1" {
  key_name   = "my-key-pair1"  # Change to your desired key pair name
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key file
}
