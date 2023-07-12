provider "aws" {
  region     = "us-east-2a"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "roman"

  tags = {
    Name        = "My Terraform Bucket"
    Environment = "Dev"
  }
}
