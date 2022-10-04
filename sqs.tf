resource "aws_sqs_queue" "simple_message_queue" {
  name = "simple-message-queue"
}

resource "aws_sqs_queue_policy" "simple_message_queue_policy" {
  queue_url = aws_sqs_queue.simple_message_queue.id

  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__owner_statement",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.simple_message_queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_s3_bucket.simple_objects_bucket.arn}"
        }
      }
    }
  ]
}
POLICY
}
