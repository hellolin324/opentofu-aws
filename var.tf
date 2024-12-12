variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "my-first-s3-bucket-${random_string.bucket_suffix.result}"
}
