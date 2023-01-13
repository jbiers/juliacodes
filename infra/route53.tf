data "aws_route53_zone" "zone" {
  name = var.APEX_DOMAIN
}

resource "aws_route53_record" "A" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "www.${var.APEX_DOMAIN}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.distribution.domain_name
    zone_id                = aws_cloudfront_distribution.distribution.hosted_zone_id
    evaluate_target_health = false
  }
}