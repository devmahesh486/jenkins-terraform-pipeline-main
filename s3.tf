resource "aws_s3_bucket" "b" {
  bucket = "my-tf-rspl-dev"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
