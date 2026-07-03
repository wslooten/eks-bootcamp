resource "aws_s3_bucket" "bootcamp" {
  bucket_prefix = "${var.project_name}-"

  tags = {
    Project = var.project_name
  }
}