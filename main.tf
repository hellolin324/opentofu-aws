locals {
  computed_bucket_name = "${var.bucket_name}-${random_string.bucket_suffix.result}"
}

resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
}

resource "aws_s3_bucket" "mybucket" {
  bucket = local.computed_bucket_name
  acl    = "private"
  tags = {
    Name        = "My First S3 Bucket"
    Environment = "dev"
  }
}
