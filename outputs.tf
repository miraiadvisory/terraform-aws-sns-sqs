output "this_sns_arn" {
  description = "The ARN of the SNS topic. Will be of format arn:aws:sns:::topicname."
  value = concat(aws_sns_topic.sns_topic[*].id, [""])[0]
}

output "this_sqs_arn" {
  description = "The ARN of the SQS queue. Will be of format arn:aws:sqs:::queuename."
  value = aws_sqs_queue.sqs_queue.arn
}
