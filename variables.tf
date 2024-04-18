variable "region" {
  description = "AWS region"
  default     = "us-west-1"  # Change to your desired region
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  default     = "my_key_pair12"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.large"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}
