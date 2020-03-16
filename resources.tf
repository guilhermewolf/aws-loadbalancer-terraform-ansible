data "aws_vpc" "example" {
  default = true
}

resource "aws_key_pair" "example" {
  key_name   = "chavedosirmao"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "example" {
  name   = "allow-all-sg"
  vpc_id = data.aws_vpc.example.id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  ingress {
    self      = true
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
  ingress {
    self      = true
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
  }
  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "lb" {
  name   = "loadbalancer"
  vpc_id = data.aws_vpc.example.id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "lb01" {
  key_name               = aws_key_pair.example.key_name
  ami                    = "ami-07ebfd5b3428b6f4d"
  vpc_security_group_ids = ["${aws_security_group.example.id}", "${aws_security_group.lb.id}"]
  instance_type          = "t2.micro"

  tags = {
    Name     = "lb01"
    Tier     = "loadbalancer"
    Provider = "terraform"
  }

}

resource "aws_instance" "app01" {
  key_name               = aws_key_pair.example.key_name
  ami                    = "ami-07ebfd5b3428b6f4d"
  vpc_security_group_ids = ["${aws_security_group.example.id}"]
  instance_type          = "t2.micro"

  tags = {
    Name     = "app01"
    Tier     = "webserver"
    Provider = "terraform"
  }

}

resource "aws_instance" "app02" {
  key_name               = aws_key_pair.example.key_name
  ami                    = "ami-07ebfd5b3428b6f4d"
  vpc_security_group_ids = ["${aws_security_group.example.id}"]
  instance_type          = "t2.micro"

  tags = {
    Name     = "app02"
    Tier     = "webserver"
    Provider = "terraform"
  }

}

resource "aws_instance" "db01" {
  key_name               = aws_key_pair.example.key_name
  ami                    = "ami-07ebfd5b3428b6f4d"
  vpc_security_group_ids = ["${aws_security_group.example.id}"]
  instance_type          = "t2.micro"

  tags = {
    Name     = "db01"
    Tier     = "database"
    Provider = "terraform"
  }

}
