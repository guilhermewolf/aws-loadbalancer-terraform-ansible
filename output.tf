output "ELB" {
  value = aws_elb.my-elb.dns_name
}

output "endpoint" {
  value = aws_db_instance.mariadb.endpoint
}

resource "local_file" "rds_endpoint" {
  content  = aws_db_instance.mariadb.endpoint
  filename = "rds_endpoint"
}
