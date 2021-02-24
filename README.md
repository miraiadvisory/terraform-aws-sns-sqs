## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) |
| [aws_sns_topic_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) |
| [aws_sqs_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) |
| [aws_sqs_queue_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| createSns | Enable/disable resource creation | `bool` | `true` | no |
| createSqs | Enable/disable resource creation | `bool` | `true` | no |
| sesCreate | Enable/disable SES creation | `bool` | `false` | no |
| sesDomain | Domain for creating SES | `string` | `""` | no |
| snsName | Name of the SNS Topic | `string` | `""` | no |
| snsSubscribe | Enable/disable SNS subscription for SQS queues | `bool` | `true` | no |
| sqsDelay | Delay (in seconds) to deliver messages | `string` | `0` | no |
| sqsEncrypted | Enable/disable SQS KMS encrypted | `bool` | `true` | no |
| sqsFifo | Makes SQS FIFO or not | `bool` | `false` | no |
| sqsName | Name of the SQS queue | `string` | `""` | no |
| sqsVisTimeout | n/a | `string` | `30` | no |
| sqsWaitTime | n/a | `string` | `0` | no |
| zone\_id | ID from the Route53 zone where we're going to create the DNS records for SES | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_sns\_arn | The ARN of the SNS topic. Will be of format arn:aws:sns:::topicname. |
| this\_sqs\_arn | The ARN of the SQS queue. Will be of format arn:aws:sqs:::queuename. |
| this\_sqs\_id | The URL of the SQS queue. Will be of format https://... |
