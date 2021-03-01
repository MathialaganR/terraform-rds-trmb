#--------------------------------------------------------------
# Documentum Server Security Groups
#--------------------------------------------------------------
resource "aws_security_group" "rds-sg" {
  name        = "${var.global_product}.${var.global_environment}.${var.rds_instance_basename}.rds.sg"
  description = "Security group for controlling the RDS instance."
  vpc_id      = "${var.global_vpc_id}"

  ingress {
    from_port       = "${var.db_port}"
    to_port         = "${var.db_port}"
    protocol        = "${var.db_protocol}"
    security_groups = ["${split(",",var.trusted_sg)}"]
  }

  ingress {
    from_port = "${var.db_port}"
    to_port   = "${var.db_port}"
    protocol  = "${var.db_protocol}"

    #cidr_blocks = ["${compact(split(",",var.access_cidr_blocks))}"]
    cidr_blocks = ["${compact(concat(split(",",var.access_cidr_blocks),split(",",var.additional_cidr_blocks)))}"]
  }

  # Authorize all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name          = "${var.global_product}.${var.global_environment}.${var.rds_instance_basename}.rds.sg"
    "product"     = "${var.global_product}"
    "environment" = "${var.global_environment}"
    "contact"     = "${var.global_contact}"
  }
}
