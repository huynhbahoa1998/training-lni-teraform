resource "aws_dynamodb_table" "inventory_table" {
  name           = "Inventory"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "Uuid"
  range_key      = "BookUuid"

  attribute {
    name = "Uuid"
    type = "S"
  }

  attribute {
    name = "BookUuid"
    type = "S"
  }

  global_secondary_index {
    name               = "BookQuantityIndex"
    hash_key           = "BookUuid"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["Quantity"]
  }
}