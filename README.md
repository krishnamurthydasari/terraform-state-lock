# terraform-state-lock
Terraform provides locking to prevent concurrent runs against the same state. Locking helps make sure that only one team member runs terraform configuration. Locking helps us prevent conflicts, data loss and state file corruption due to multiple runs on same state file.

DynamoDB can be used as a locking mechanism to remote storage backend S3 to store state files. The DynamoDB table is keyed on “LockID” which is set as a bucketName/path, so as long as we have a unique combination of this we don’t have any problem in acquiring locks and running everything in a safe way.

To use DynamoDB as a locking mechanism, we first need to create a dynamoDB table, let’s call it “terraform-lock”. Once we have our dynamo DB table “terraform-lock” ready, let’s setup dynamo DB as our locking mechanism with s3 remote backend by adding below code in our existing terraform.tf code:

terraform {
  backend "s3" {
    bucket = "terraformbackend"
    key = "terraform"
    region = "us-east-2"
    dynamodb_table = "terraform-lock"
  }
}

