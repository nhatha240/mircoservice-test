
resource "aws_s3_bucket_analytics_configuration" "dev-entire-bucket" {
  bucket = aws_s3_bucket.Private-Bucket-Dev.id
  name   = "EntireBucket"
# Add analytics configuration for entire S3 bucket and export results to a second S3 bucket
  storage_class_analysis {
    data_export {
      destination {
        s3_bucket_destination {
          bucket_arn = aws_s3_bucket.analytics.arn
        }
      }
    }
  }
#Add analytics configuration with S3 object filter
  filter {
    prefix = "documents/"

    tags = {
      priority = "high"
      class    = "blue"
    }
  }

}
# Add an intelligent tiering configuration for the entire S3 bucket
resource "aws_s3_bucket_intelligent_tiering_configuration" "dev-entire-bucket" {
  bucket = aws_s3_bucket.Private-Bucket-Dev.id
  name   = "EntireBucket"
  # Add intelligent tiering by filtering configuration for entire S3 bucket
  filter {
    prefix = "documents/"

    tags = {
      priority = "high"
      class    = "blue"
    }
  }
  # Add intelligent tiering by days configuration for entire S3 bucket
  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = 180
  }
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 125
  }
}

# Create an S3 bucket private
resource "aws_s3_bucket" "Private-Bucket-Dev" {
  bucket = "Private-Bucket-dev" #name of the bucket
  force_destroy = true
  
  tags = {
    Name        = "Private bugket"
    Environment = "Dev"
    make        = "Terraform"
  }
}

# create an S3 bucket with CORS configuration
resource "aws_s3_bucket_cors_configuration" "Private-Bucket-Dev" {
  bucket = aws_s3_bucket.Private-Bucket-Dev.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}
resource "aws_s3_bucket" "analytics" {
  bucket = "analytics-destination"
  tags = {
    Name        = "analytics destination"
    Environment = "Dev"
    make        = "Terraform"
  }
}
