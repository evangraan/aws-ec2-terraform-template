variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "environment" {
  description = "Environment"
  default = "environment"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default = "10.0.1.0/24"
}

variable "region" {
  description = "Region in which the RTMP hosts will be launched"
  default = "eu-west-2"
}

variable "public_subnets_cidr" {
  type        = list
  description = "CIDR block for Public Subnet"
  default = ["10.0.1.0/24"]
}

variable "private_subnets_cidr" {
  type        = list
  description = "CIDR block for Private Subnet"
  default = ["172.32.16.0/20"]
}

variable "availability_zones" {
  description = "The availability zones to use for subnets and resources in the VPC. By default, all AZs in the region will be used."
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c",]
}

