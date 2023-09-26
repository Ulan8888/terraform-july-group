resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_s3_bucket" "example" {
  bucket_prefix = "hi-"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "kaizen12345678910"
}

output "backet_info" {
  value = [
    aws_s3_bucket.bucket.bucket,
    aws_s3_bucket.bucket.arn
  ]
}







