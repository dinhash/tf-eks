terraform {
  backend "s3" {
    bucket = "bucket-irdeto"
    key    = "backend/terraform.tfstate"
    region = "us-west-2"
  }
}
