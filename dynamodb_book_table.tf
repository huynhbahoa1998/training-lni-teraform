resource "aws_dynamodb_table" "book_table" {
  name           = "Book"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "Uuid"

  attribute {
    name = "Uuid"
    type = "S"
  }
}
