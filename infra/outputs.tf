output "bucket_url" {
  value = aws_s3_bucket_website_configuration.juliacodes.website_endpoint
}