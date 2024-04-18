resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("./id_rsa.pub")  # Path to your public key file
  private_key = file("./privatekey.pem")  # Path to your private key file
}
