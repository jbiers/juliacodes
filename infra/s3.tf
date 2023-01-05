resource "aws_s3_bucket" "juliacodes" {
    bucket  = "juliacodes.com"
    acl     = "public-read"
    policy  = file("policy.json")

    tags = {
        Name        = "juliacodes"
    }
}

resource "aws_s3_bucket_website_configuration" "juliacodes" {
    bucket = aws_s3_bucket.juliacodes

    index_document {
      suffix = "index.html"
    }

    error_document {
      key = "error.html"
    }
}