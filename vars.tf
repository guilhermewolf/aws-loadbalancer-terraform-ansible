variable "AWS_REGION" {
  default = "us-east-1"
}

variable "RDS_PASSWORD" {
  default = "euamopudim"
}

variable "RDS_USERNAME" {
  default = "root"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-07ebfd5b3428b6f4d"
  }
}
