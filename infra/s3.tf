resource "aws_s3_bucket" "juliacodes" {
  bucket = "juliacodes.com"

  tags = {
    Name = "juliacodes"
  }
}

resource "aws_s3_bucket_acl" "juliacodes" {
  bucket = aws_s3_bucket.juliacodes.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "juliacodes" {
  bucket = aws_s3_bucket.juliacodes.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "juliacodes" {
  bucket = aws_s3_bucket.juliacodes.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "juliacodes" {
  bucket = aws_s3_bucket.juliacodes.id
  policy = data.aws_iam_policy_document.allow_public_access.json
}

data "aws_iam_policy_document" "allow_public_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.juliacodes.arn}/*"
    ]
  }
}