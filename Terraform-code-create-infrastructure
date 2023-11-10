# Define provider
provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAR63BURLVVHHT"
  secret_key = "tgONC7fhGTlneRGsvCKd8IXHFP/h9DWM"
}

# Create VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "example-vpc"
  }
}

# Create subnets
resource "aws_subnet" "example_subnet_1" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "example-subnet-1"
  }
}

resource "aws_subnet" "example_subnet_2" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "example-subnet-2"
  }
}

# Create security group
resource "aws_security_group" "example_security_group" {
  name = "example-security-group"
  description = "Example security group"
  vpc_id = aws_vpc.example_vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 instance
resource "aws_instance" "example_instance" {
  ami = "ami-02e94b011299ef128"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.example_subnet_1.id
  vpc_security_group_ids = [aws_security_group.example_security_group.id]
  key_name = aws_key_pair.example_key_pair.key_name
  tags = {
    Name = "example-instance"
  }

}
# Create key pair
resource "aws_key_pair" "example_key_pair" {
  key_name   = "example-key-pair"
  public_key = file("/root/.ssh/id_rsa")
}
# Create S3 bucket
resource "aws_s3_bucket" "sampledatastore-bucket" {
  bucket = "sampledatastore-bucket"
  tags = {
    Name = "sampledatastore-bucket"
  }
}

