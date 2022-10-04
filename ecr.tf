resource "aws_ecr_repository" "inventory_repository" {
  name = "inventory-service"
}

resource "aws_ecr_repository" "author_repository" {
  name = "author-service"
}

resource "aws_ecr_repository" "book_repository" {
  name = "book-service"
}
