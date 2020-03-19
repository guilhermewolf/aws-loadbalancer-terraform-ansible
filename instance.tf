# resource "aws_instance" "lb01" {
#   key_name               = aws_key_pair.example.key_name
#   ami                    = "ami-07ebfd5b3428b6f4d"
#   vpc_security_group_ids = ["${aws_security_group.example.id}", "${aws_security_group.lb.id}"]
#   instance_type          = "t2.micro"
#
#   tags = {
#     Name     = "lb01"
#     Tier     = "loadbalancer"
#     Provider = "terraform"
#   }
# }

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

resource "aws_instance" "db01" {
  key_name               = aws_key_pair.example.key_name
  ami                    = var.AMIS[var.AWS_REGION]
  subnet_id              = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.internal.id]
  instance_type          = "t2.micro"

  tags = {
    Name     = "db01"
    Tier     = "database"
    Provider = "terraform"
  }
}
