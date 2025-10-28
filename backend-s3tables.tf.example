# S3 Tables State Locking Backend Configuration
# Alternative to DynamoDB for Terraform state locking

terraform {
  backend "s3" {
    bucket = "awsweek2ec2instances"
    key    = "terraform/multi-region-ec2/terraform.tfstate"
    region = "us-east-1"
    
    # S3 Tables configuration for state locking
    # Note: This requires S3 Tables service and proper IAM permissions
    dynamodb_table = "terraform-state-lock-s3tables"
    encrypt        = true
  }
}

# S3 Tables resources for state locking
resource "aws_s3tables_table_bucket" "terraform_state_lock" {
  name = "terraform-state-lock-bucket"
}

resource "aws_s3tables_namespace" "terraform" {
  table_bucket_arn = aws_s3tables_table_bucket.terraform_state_lock.arn
  namespace        = "terraform"
}

resource "aws_s3tables_table" "state_lock" {
  table_bucket_arn = aws_s3tables_table_bucket.terraform_state_lock.arn
  namespace        = aws_s3tables_namespace.terraform.namespace
  name            = "state-lock"
  format          = "ICEBERG"

  metadata = {
    iceberg = {
      schema = {
        type = "struct"
        fields = [
          {
            id       = 1
            name     = "LockID"
            type     = "string"
            required = true
          },
          {
            id       = 2
            name     = "Operation"
            type     = "string"
            required = true
          },
          {
            id       = 3
            name     = "Info"
            type     = "string"
            required = false
          },
          {
            id       = 4
            name     = "Who"
            type     = "string"
            required = false
          },
          {
            id       = 5
            name     = "Version"
            type     = "string"
            required = false
          },
          {
            id       = 6
            name     = "Created"
            type     = "timestamp"
            required = false
          },
          {
            id       = 7
            name     = "Path"
            type     = "string"
            required = false
          }
        ]
      }
      table-properties = {
        description = "Terraform state locking table using S3 Tables"
      }
    }
  }
}

# IAM policy for S3 Tables state locking
resource "aws_iam_policy" "s3tables_state_lock" {
  name        = "terraform-s3tables-state-lock"
  description = "IAM policy for Terraform state locking with S3 Tables"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3tables:GetTable",
          "s3tables:PutTableData",
          "s3tables:GetTableData",
          "s3tables:DeleteTableData",
          "s3tables:ListTables"
        ]
        Resource = [
          aws_s3tables_table.state_lock.arn,
          "${aws_s3tables_table_bucket.terraform_state_lock.arn}/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "s3tables:ListTableBuckets",
          "s3tables:ListNamespaces"
        ]
        Resource = "*"
      }
    ]
  })
}
