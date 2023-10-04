terraform {
  backend "s3" {
    bucket = "kaizen-ulanbek12345678"
    key    = "kaizen/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lock-state"
  }
}