# Output the ID of the RDS instance
output "rds_instance_id" {
  value = "${aws_db_instance.main_rds_instance.id}"
}

# Output the Address of the RDS instance
output "rds_instance_address" {
  value = "${aws_db_instance.main_rds_instance.address}"
}

# Output the port
output "rds_instance_port" {
  value = "${aws_db_instance.main_rds_instance.port}"
}

# Output the endpoint
output "rds_instance_endpoint" {
  value = "${aws_db_instance.main_rds_instance.endpoint}"
}

# Output the security group ID
output "rds_instance_sg_id" {
  value = "${aws_security_group.rds-sg.id}"
}
