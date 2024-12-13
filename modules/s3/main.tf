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
    Environment = terraform.workspace
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

resource "aws_s3_bucket_public_access_block" "mybucket_public_access_block" {
  bucket                  = aws_s3_bucket.mybucket.id
  block_public_acls       = local.enable_block_public_access
  block_public_policy     = local.enable_block_public_access
  ignore_public_acls      = local.enable_block_public_access
  restrict_public_buckets = local.enable_block_public_access
}

resource "aws_s3_bucket_policy" "mybucket_policy" {
  count  = var.allow_public_access ? 1 : 0
  bucket = aws_s3_bucket.mybucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.mybucket.arn}/*"
      }
    ]
  })
  depends_on = [aws_s3_bucket_public_access_block.mybucket_public_access_block]
}