terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}

provider "aws" {
  alias  = "ap_south_1"
  region = "ap-south-1"
}

# Data sources for AMIs
data "aws_ami" "graviton_ami" {
  provider    = aws.us_east_1
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-arm64-gp2"]
  }
}

data "aws_ami" "x86_ami_west" {
  provider    = aws.us_west_2
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_ami" "x86_ami_mumbai" {
  provider    = aws.ap_south_1
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# US-East-1: 3x t4g.medium (Graviton)
resource "aws_instance" "us_east_1_graviton" {
  provider      = aws.us_east_1
  count         = 3
  ami           = data.aws_ami.graviton_ami.id
  instance_type = "t4g.medium"
  
  tags = {
    Name        = "graviton-instance-${count.index + 1}"
    Environment = "production"
    Region      = "us-east-1"
    Architecture = "arm64"
  }
}

# US-West-2: 2x t3.medium
resource "aws_instance" "us_west_2_x86" {
  provider      = aws.us_west_2
  count         = 2
  ami           = data.aws_ami.x86_ami_west.id
  instance_type = "t3.medium"
  
  tags = {
    Name        = "x86-instance-west-${count.index + 1}"
    Environment = "production"
    Region      = "us-west-2"
    Architecture = "x86_64"
  }
}

# AP-South-1: 4x t3.large
resource "aws_instance" "ap_south_1_x86" {
  provider      = aws.ap_south_1
  count         = 4
  ami           = data.aws_ami.x86_ami_mumbai.id
  instance_type = "t3.large"
  
  tags = {
    Name        = "x86-instance-mumbai-${count.index + 1}"
    Environment = "production"
    Region      = "ap-south-1"
    Architecture = "x86_64"
  }
}
