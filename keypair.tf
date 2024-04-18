resource "aws_key_pair" "my_key_pair12" {
  key_name   = "my-key-pair12"  # Change to your desired key pair name
  public_key = file("./id_rsa.pub")  # Path to your public key file
}
