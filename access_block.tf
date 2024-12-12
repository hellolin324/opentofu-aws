resource "aws_s3_bucket_public_access_block" "mybucket_public_access_block" {
  bucket                  = aws_s3_bucket.mybucket.id
  block_public_acls       = local.enable_block_public_access
  block_public_policy     = local.enable_block_public_access
  ignore_public_acls      = local.enable_block_public_access
  restrict_public_buckets = local.enable_block_public_access
}

