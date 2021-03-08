resource "aws_db_instance" "main_rds_instance" {
  identifier                          = "${var.global_product}-${var.global_environment}-${var.rds_instance_basename}-rds"
  allocated_storage                   = "${var.rds_allocated_storage}"
  engine                              = "${var.rds_engine_type}"
  engine_version                      = "${var.rds_engine_version}"
  instance_class                      = "${var.rds_instance_class}"
  name                                = "${var.database_name}"
  snapshot_identifier                 = "${var.snapshot_id}"
  username                            = "${var.database_user}"
  password                            = "${var.database_password}"
  vpc_security_group_ids              = ["${aws_security_group.rds-sg.id}"]
  db_subnet_group_name                = "${aws_db_subnet_group.main_db_subnet_group.name}"
  parameter_group_name                = "${var.db_parameter_group_name == "" ? aws_db_parameter_group.default.name: var.db_parameter_group_name}"
  multi_az                            = "${var.rds_is_multi_az}"
  storage_type                        = "${var.rds_storage_type}"
  final_snapshot_identifier           = "${var.global_product}-${var.global_environment}-${var.rds_instance_basename}-rds-final"
  copy_tags_to_snapshot               = "${var.snapshot_tags}"
  publicly_accessible                 = "${var.public}"
  backup_retention_period             = "${var.backup_retention_period}"
  apply_immediately                   = "${var.apply_immediately}"
  skip_final_snapshot                 = "${var.skip_final_snapshot}"
  license_model                       = "${var.license_model}"
  storage_encrypted                   = "${var.kms_key_id != "" ? true : false}"
  kms_key_id                          = "${var.kms_key_id}"
  character_set_name                  = "${var.character_set_name}"
  deletion_protection                 = "${var.rds_deletion_protection}"
  iam_database_authentication_enabled = "${var.rds_iam_database_auth}"

  lifecycle {
    ignore_changes  = ["name"]
    prevent_destroy = false    #lifecycle blocks cannot contain interpolated values. https://github.com/hashicorp/terraform/issues/3116
  }

  tags {
    Name        = "${var.global_product}-${var.global_environment}-${var.rds_instance_basename}-rds"
    Environment = "${var.global_environment}"
    costcentre  = "${var.global_costcentre}"
    Standard    = "BU=${var.business_unit}:Product=${var.global_product}:ENV=${var.global_environment}:Role=${var.purpose}:Apps=${var.apps}"
    Product     = "${var.global_product}"
    Product     = "${var.tag_product}"
  }
}

resource "aws_db_parameter_group" "default" {
  name        = "${var.global_product}-${var.global_environment}-${var.rds_instance_basename}-rds-pg"
  family      = "${var.db_parameter_group_family}"
  description = "RDS default parameter group"
}

resource "aws_db_subnet_group" "main_db_subnet_group" {
  name        = "${var.global_product}.${var.global_environment}.${var.rds_instance_basename}.rds.subnetgrp"
  description = "${var.global_product}-${var.global_environment}-${var.rds_instance_basename}-rds subnet group"
  subnet_ids  = ["${split(",", var.private_subnets)}"]

  lifecycle {
    ignore_changes = ["name"]
  }
}
