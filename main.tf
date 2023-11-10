provider "aws" {
region = "ap-south-1"
access_key = "AKIAR6CGWM4Q"
secret_key = "lLfIJCdcxpw0xtds7pBO0zykT3KpTaAe3H8"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-02e94b011299ef128"
    instance_type = "t2.micro"
    key_name= "terraform-key"
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}


