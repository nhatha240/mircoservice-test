resource "aws_s3_bucket" "tfer--test-s3-dev-terraform" {
  bucket        = "test-s3-dev-terraform"
  force_destroy = "false"

  grant {
    id          = "c8a1fc4d7a81629cfb0d4aab62229fa955dcde7edba826a6341f1e86260f66c1"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "true"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}
