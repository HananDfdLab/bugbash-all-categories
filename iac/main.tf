# Intentionally misconfigured Terraform for security scanning tests

# S3 bucket with public read access and no encryption
resource "aws_s3_bucket" "vulnerable_bucket" {
  bucket = "bugbash-public-data"
  acl    = "public-read"

  versioning {
    enabled = false
  }

  # No server-side encryption
  # No logging configuration
  # No lifecycle rules
}

# Security group open to the world on all ports
resource "aws_security_group" "wide_open" {
  name        = "allow-everything"
  description = "Intentionally insecure security group"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS instance with no encryption and public access
resource "aws_db_instance" "vulnerable_db" {
  identifier        = "bugbash-db"
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = "admin"
  password          = "admin123"

  publicly_accessible    = true
  storage_encrypted      = false
  skip_final_snapshot    = true

  # No backup retention
  backup_retention_period = 0
}
