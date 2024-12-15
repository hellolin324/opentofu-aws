output "s3_bucket_name" {
  value = terraform.workspace == "dev" ? module.s3_bucket_dev[0].bucket_name : (
          terraform.workspace == "prod" ? module.s3_bucket_prod[0].s3_bucket_id : null
  )
}

