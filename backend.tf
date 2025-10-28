terraform {
  backend "s3" {
    bucket = "awsweek2ec2instances"
    key    = "terraform/multi-region-ec2/terraform.tfstate"
    region = "us-east-1"
  }
}
