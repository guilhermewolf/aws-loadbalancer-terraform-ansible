resource "aws_instance" "app01" {
  key_name               = aws_key_pair.example.key_name
  ami                    = var.AMIS[var.AWS_REGION]
  subnet_id              = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.internal.id]
  instance_type          = "t2.micro"

  tags = {
    Name     = "app01"
    Tier     = "webserver"
    Provider = "terraform"
  }
}

resource "aws_instance" "app02" {
  key_name               = aws_key_pair.example.key_name
  ami                    = var.AMIS[var.AWS_REGION]
  subnet_id              = aws_subnet.main-public-2.id
  vpc_security_group_ids = [aws_security_group.internal.id]
  instance_type          = "t2.micro"

  tags = {
    Name     = "app02"
    Tier     = "webserver"
    Provider = "terraform"
  }
}
