output "topic_arn" {
  #value = aws_sns_topic.sns_topic[0].id
  value = concat(aws_sns_topic.sns_topic[*].id, [""])[0]
}
