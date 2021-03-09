resource "aws_s3_bucket" "dq_log_archive_bucket" {
  bucket = "s3-dq-log-archive-ci"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "s3-dq-log-archive-ci"
  }
}

resource "aws_s3_bucket" "dq_aws_config_bucket" {
  bucket = "s3-dq-aws-config-ci"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # logging {
  #   target_bucket = aws_s3_bucket.dq_log_archive_bucket.id
  #   target_prefix = "dq_aws_config/"
  # }

  tags = {
    Name = "s3-dq-aws-config-ci"
  }
}
#
# resource "aws_s3_bucket_policy" "dq_aws_config_bucket_policy" {
#   bucket = aws_s3_bucket.dq_aws_config_bucket.id
#
#   policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "HTTP",
#       "Effect": "Deny",
#       "Principal": "*",
#       "Action": "*",
#       "Resource": "arn:aws:s3:::dq-logs-archive/*",
#       "Condition": {
#         "Bool": {
#           "aws:SecureTransport": "false"
#         }
#       }
#     }
#   ]
# }
# POLICY
#
#   depends_on = [aws_s3_bucket.dq_aws_config_bucket]
#
# }
#
# resource "aws_s3_bucket_metric" "dq_aws_config_bucket_logging" {
#   bucket = aws_s3_bucket.dq_aws_config_bucket.bucket
#   name   = "dq_aws_config_metric"
# }
