resource "aws_dynamodb_table" "author_table" {
  name           = "Author"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "Uuid"

  attribute {
    name = "Uuid"
    type = "S"
  }
}
