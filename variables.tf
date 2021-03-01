variable "rds_instance_basename" {
  description = "RDS instance name is in the form (product)-(environment)-(basename)-rds"
}

variable "kms_key_id" {
  default = ""
}

variable "rds_is_multi_az" {
  default = "false"
}

variable "rds_instance_class" {}

variable "rds_storage_type" {
  # Valid types are:  # - standard  # - gp2  # - io1
}

variable "rds_storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  default     = "false"
}

variable "character_set_name" {
  description = "Specifies which character set to be used (for Oracle instances). Defaults to blank."
  default     = ""
}

variable "rds_allocated_storage" {
  description = "The allocated storage in GBs"

  # You just give it the number, e.g. 10
}

variable "rds_engine_type" {
  # Valid types are:  # - mysql  # - postgres  # - oracle-*  # - sqlserver-*  # http://docs.aws.amazon.com/AmazonRDS/latest/CommandLineReference/CLIReference-cmd-CreateDBInstance.html  # See --engine
}

variable "rds_engine_version" {
  # For valid engine versions, see:  # See http://docs.aws.amazon.com/AmazonRDS/latest/CommandLineReference/CLIReference-cmd-CreateDBInstance.html  # --engine-version
}

variable "license_model" {
  description = "RDS instance licensing - AWS supply license, we supply license, or db has GPL license"

  # Valid types are:
  # - license-included
  # - bring-your-own-license
  # - general-public-license
}

variable "snapshot_id" {
  default = ""
}

variable "database_name" {
  description = "The name of the database to create"
}

variable "database_user" {}
variable "database_password" {}

variable "db_parameter_group_name" {
  description = "To specify custom db parameters enter the name of an existing parameter group, or leave blank to create default parameter group using 'db_parameter_group_family'"
  default     = ""
}

variable "db_parameter_group_family" {
  # postgres9.3  # postgres9.4  # mysql5.6
}

# RDS Security Group
variable "global_contact" {
  description = "The contact label to tag resources"
  default     = "rmathialagan@gmail.com"
}

variable "global_product" {
  description = "The overarching Product (everything in this VPC will be named after it)"
}

variable "global_environment" {
  description = "The Application environment (dev, uat, sit, prod, etc)"
}

variable "global_costcentre" {
  description = "The costcentre label to tag resources"
  default     = "add-costcentre-code"
}

variable "global_vpc_id" {
  description = "The ID of the VPC where the stack is being deployed"
}

variable "db_port" {
  description = "The port the clients will use to connect to the db"
}

variable "db_protocol" {
  description = "The protocol the clients will use to connect to the db"
}

variable "trusted_sg" {
  description = "The security groups that house the applications that need access to the db"
}

variable "access_cidr_blocks" {

  default     = ""
}

# RDS Subnet Group Variables
variable "private_subnets" {
  description = "The private subnets ids for the VPC"
}

variable "apps" {
  description = "The list of one or more applications the resource supports, separated by the plus sign +"
}

variable "purpose" {
  description = " Enter the role of the EC2 instance"
  default     = "rds"
}

variable "business_unit" {
  description = "The business unit that owns the resource"
}

variable "snapshot_tags" {
  description = "Copy all instance tags to snapshot"
  default     = "false"
}

variable "public" {
  description = "Is the instance publicly accessible?"
  default     = "false"
}

variable "backup_retention_period" {
  description = "Number of days to retain backups for"
  default     = "14"
}

variable "apply_immediately" {
  description = "Should database modifications be applied immediately?"
  default     = "false"
}

variable "skip_final_snapshot" {
  description = "Determines whether final snapshot is created before instance is deleted"
  default     = "true"
}

variable "additional_cidr_blocks" {
  description = "Additional CIDR ranges that are granted access"
  default     = ""
}

variable "route53_required" {
  description = "Set to true to create a route53 record for the RDS insrance"
  default     = "false"
}

variable "global_phz_id" {
  default = "NA"
}

variable "rds_route53" {
  description = "Route53 entry to create for your instance"
  default     = "NA"
}



variable "tag_product" {}

variable "tag_cpmbackup" {
  default = ""
}

variable "rds_deletion_protection" {
  description = "Should the DB instance have deletion protection enabled?"
  default     = "true"
  type        = "string"
}

variable "rds_iam_database_auth" {
  description = "Specifies whether mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  default = "false"
}
