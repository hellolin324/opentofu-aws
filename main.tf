provider "aws" {
  region = var.aws_region
}

module "s3_bucket_dev" {
  source              = "./modules/s3"
  count = terraform.workspace == "dev" ? 1 : 0           
}


module "s3_bucket_prod" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.0"


  tags = {
    Environment = terraform.workspace
    Project     = "S3 Bucket Test with no name"
  }

  count = terraform.workspace == "prod" ? 1 : 0
}









