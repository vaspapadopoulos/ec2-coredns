terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_key_pair" "key_pair" {
  key_name = var.key_name
  public_key = var.public_key
}
