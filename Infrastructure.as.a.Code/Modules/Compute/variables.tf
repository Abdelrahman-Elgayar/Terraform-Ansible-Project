variable "vpc_id" {
  type = string
}

variable "instance_type" {
  type    = string
}

variable "subnet1_id" {
  type = string
}

variable "subnet2_id" {
  type = string
}

variable "subnet3_id" {
  type = string
}

variable "subnet4_id" {
  type = string
}

variable "sg_id" {
  type = list(string)
}

variable "instance_name" {
  type    = list(string)
}

variable "volume_name" {
  type    = list(string)
}

variable "key_pair" {
  type = string
}

# variable "alb_name" {
#   type    = list(string)
# }