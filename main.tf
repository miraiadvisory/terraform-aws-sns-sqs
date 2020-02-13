resource "aws_sns_topic" "sns_topic" {
  name = var.snsName
}

resource "aws_sqs_queue" "sqs_queue" {
  name                              = var.sqsName
  fifo_queue                        = var.sqsFifo
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
}

resource "aws_sns_topic_subscription" "sns_subscription_sqs" {
  count = var.snsSubscribe ? 1 : 0

  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs_queue.arn
}