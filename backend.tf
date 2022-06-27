terraform {
  backend "s3" {
    bucket = "bucket-name"
    key    = "backend/terraform.tfstate"
    region = "us-west-2"
  }
}
