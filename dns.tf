resource "aws_route53_record" "main_rds_instance" {
  count   = "${var.route53_required ? 1 : 0}"
  zone_id = "${var.global_phz_id}"
  name    = "${var.rds_route53}"
  type    = "A"

  alias {
    name                   = "${aws_db_instance.main_rds_instance.address}"
    zone_id                = "${aws_db_instance.main_rds_instance.hosted_zone_id}"
    evaluate_target_health = true
  }
}
