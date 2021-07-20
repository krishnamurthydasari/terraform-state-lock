provider "aws" {}

terraform {
  backend "s3" {
    bucket = "aaaaatest"
    key = "terraform.state"
    dynamodb_table = "terraform-lock"
  }
}

output "test" {
  value = "Hello"
}
