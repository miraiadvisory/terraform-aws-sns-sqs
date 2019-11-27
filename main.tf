resource "aws_sns_topic" "sns_topic" {
  name = "${var.snsName}"
}

resource "aws_sqs_queue" "sqs_queue" {
  name                              = "${var.sqsName}"
  fifo_queue                        = "${var.sqsFifo}"
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
}

resource "aws_sns_topic_subscription" "sns_subscription_sqs" {
  count = var.snsSubscribe ? 1 : 0

  topic_arn = "${aws_sns_topic.sns_topic.arn}"
  protocol  = "sqs"
  endpoint  = "${aws_sqs_queue.sqs_queue.arn}"
}

#resource "aws_ses_domain_identity" "ses_domain" {
#  domain = "${var.sesDomain}"
#}
#
#resource "aws_ses_domain_dkim" "dkim_domain" {
#  domain = "${aws_ses_domain_identity.ses_domain.domain}"
#}
#
#resource "aws_route53_record" "ses_verification_record" {
#  zone_id = "${var.zone_id}"
#  name    = "_amazonses.${aws_ses_domain_identity.ses_domain.domain}"
#  type    = "TXT"
#  ttl     = "600"
#  records = ["${aws_ses_domain_identity.ses_domain.verification_token}"]
#}
