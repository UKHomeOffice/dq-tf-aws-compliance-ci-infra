variable "naming_suffix" {
}

variable "NAMESPACE" {
  default = "ci"
}

variable "s3_bucket_name" {
  dq_aws_config = "s3-dq-aws-config-${var.NAMESPACE}"
  description   = "Map of the S3 bucket names"
  type          = map(string)
}

variable "s3_bucket_acl" {
  dq_aws_config = "private"
  description   = "Map of the S3 bucket canned ACLs"
  type          = map(string)
}
