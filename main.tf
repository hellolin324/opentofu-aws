locals {
  computed_bucket_name = "${var.bucket_name}-${random_string.bucket_suffix.result}"
  enable_block_public_access = !var.allow_public_access
}

resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket" "mybucket" {
  bucket = local.computed_bucket_name
  tags = {
    Name        = "My First S3 Bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "mybucket_versioning" {
  bucket = aws_s3_bucket.mybucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "mybucket_lifecycle" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    id     = "delete-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}





