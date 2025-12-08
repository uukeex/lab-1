terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.25.0"
    }
  }
}


provider "aws" {
  default_tags {
    tags = {
      Owner = "xx"
    }
  }
}


variable "bucket_prefix" {
  description = "S3 bucket prefix"
  type        = string
  default     = "awsninja6-"
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default = {
    purpose = "learning"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket_prefix = var.bucket_prefix

  tags = merge(
    var.tags,
    { Owner = "xx" }
  )
}

resource "aws_s3_object" "object" {
  for_each = fileset(path.module, "messages/*")
  bucket   = aws_s3_bucket.my_bucket.bucket
  key      = basename(each.key)
  source   = each.key
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.my_bucket.bucket_domain_name
}

#output "bucket_http_url" {
#  value = "http://${aws_s3_bucket.my-bucket.bucket}.s3.amazonaws.com"
#}
