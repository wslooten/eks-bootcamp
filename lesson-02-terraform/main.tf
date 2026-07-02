terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "bootcamp_bucket" {
  bucket_prefix = "eks-bootcamp-"

  tags = {
    Project = "EKS Bootcamp"
    Lesson  = "02"
  }
}