provider "aws" {
  region                      = "us-east-1"
  access_key                  = "accessKey"
  secret_key                  = "secretKey"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "bucketOne" {
  bucket = "localstack-terraform-bucket"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket.bucketOne]

  bucket     = aws_s3_bucket.bucketOne.id
  acl        = "public-read"
}