variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The base name for the S3 bucket (suffix will be appended)"
  default     = "my-first-s3-bucket"
}

variable "allow_public_access" {
  description = "Enable or disable public read access to the bucket"
  type        = bool
  default     = false
}

