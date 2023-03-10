# resource "aws_s3_bucket" "remote-state-backend" {
#     bucket = "terraform-project-state-backend"
# }

# resource "aws_s3_bucket_versioning" "versioning-enabled" {
#     bucket = aws_s3_bucket.remote-state-backend.id
#     versioning_configuration {
#       status = "Enabled"
#     } 
# }

# resource "aws_dynamodb_table" "lock-state" {
#     name = "lock-state"
#     billing_mode = "PAY_PER_REQUEST"
#     hash_key = "LockID"
#     attribute {
#       name = "LockID"
#       type= "S"
#     } 
# }

terraform {
  backend "s3" {
    bucket = "terraform-project-state-backend"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "lock-state"
    #encrypt = true
  }
}

