resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
  acl    = "private"
  tags = {
    Name        = "My First S3 Bucket"
    Environment = "dev"
  }
}

resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
}
