resource "aws_key_pair" "example" {
  key_name   = "chavedosirmao"
  public_key = file("~/.ssh/id_rsa.pub")
}
