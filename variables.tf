variable "snsName" {
  description = "Name of the SNS Topic"
  default     = ""
  type        = string
}

variable "sqsName" {
  description = "Name of the SQS queue"
  default     = ""
  type        = string
}

variable "sqsFifo" {
  description = "Makes SQS FIFO or not"
  default     = false
  type        = bool
}

variable "sqsDelay" {
  description = "Delay (in seconds) to deliver messages"
  default     = 0
  type        = string
}

variable "sqsVisTimeout" {
  description = ""
  default     = 30
  type        = string
}

variable "sqsEncrypted" {
  description = "Enable/disable SQS KMS encrypted"
  default     = true
  type        = bool
}

variable "snsSubscribe" {
  description = "Enable/disable SNS subscription for SQS queues"
  default     = true 
  type        = bool 
}

variable "sesCreate" {
  description = "Enable/disable SES creation"
  default     = false
  type        = bool
}

variable "createSns" {
  description = "Enable/disable resource creation"
  default     = true
  type        = bool
}

variable "createSqs" {
  description = "Enable/disable resource creation"
  default     = true
  type        = bool
}

variable "sesDomain" {
  description = "Domain for creating SES"
  default     = ""
  type        = string
}

variable "zone_id" {
  description = "ID from the Route53 zone where we're going to create the DNS records for SES"
  default     = ""
  type        = string
}
