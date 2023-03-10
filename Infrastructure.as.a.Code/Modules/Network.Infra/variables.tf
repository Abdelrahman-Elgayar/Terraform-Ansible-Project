variable "vpc_cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "AZ1_subnet_cidr_block" {
  type = list(string)
}

variable "AZ2_subnet_cidr_block" {
  type = list(string)
}

variable "availability_zones" {
  type    = list(string)
}

variable "public_ip" {
  type    = list(bool)
}

variable "AZ1_subnet_name" {
  type    = list(string)
}
variable "AZ2_subnet_name" {
  type    = list(string)
}

variable "internet_gateway_name" {
  type = string
}

variable "eip_name" {
  type    = string
}

variable "Nat_gw" {
  type    = string
}


variable "RT_name" {
  type    = list(string)
}

variable "security_source" {
  type    = string
}