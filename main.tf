provider "aws" {}

terraform {
  backend "s3" {
    bucket = "terraformbackend"
    key = "terraform"
    region = "us-east-2"
    dynamodb_table = "terraform-lock"
  }
}

output "test" {
  value = "Hello"
}
