locals {
    kms_master_key_id = var.sqsEncrypted == true ?  "alias/aws/sqs" : ""
    kms_data_key_reuse_period_seconds = var.sqsEncrypted == true ? 300 : ""
}

resource "aws_sns_topic" "sns_topic" {
  name    = var.snsName
  #policy  = data.aws_iam_policy_document.sns-topic-policy.json
}

resource "aws_sqs_queue" "sqs_queue" {
  name                              = var.sqsName
  fifo_queue                        = var.sqsFifo
  kms_master_key_id                 = local.kms_master_key_id
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = "${aws_sqs_queue.sqs_queue.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.sqs_queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.sns_topic.arn}"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_sns_topic_subscription" "sns_subscription_sqs" {
  count = var.snsSubscribe ? 1 : 0
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs_queue.arn
}
