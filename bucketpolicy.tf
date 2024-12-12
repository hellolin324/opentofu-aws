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