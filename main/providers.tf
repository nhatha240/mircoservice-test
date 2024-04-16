terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.45"
    }
  }

  required_version = ">= 1.8.0"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

