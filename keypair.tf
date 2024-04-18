resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("./id_rsa.pub")  # Relative path to the id_rsa.pub file
}

