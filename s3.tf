resource "aws_s3_bucket" "simple_objects_bucket" {
  bucket = "simple-objects-bucket"
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "simple_objects_bucket_public_access_block" {
  bucket = aws_s3_bucket.simple_objects_bucket.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_notification" "simple_objects_bucket_notification" {
  bucket = aws_s3_bucket.simple_objects_bucket.id

  queue {
    queue_arn = aws_sqs_queue.simple_message_queue.arn
    events    = ["s3:ObjectCreated:*"]
  }
}
