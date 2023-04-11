provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "admin_role" {
  name = "admin"
  arn  = "arn:aws:iam::896625496087:role/admin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { AWS = "*" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "admin_policy_attachment" {
  policy_arn = "arn:aws:iam::896625496087:policy/AdministratorAccess"
  role       = "arn:aws:iam::896625496087:role/admin"
}
