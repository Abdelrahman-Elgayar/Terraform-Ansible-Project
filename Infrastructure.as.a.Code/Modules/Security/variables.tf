variable "vpc_id" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}


variable "security_rules" {
  type = object({
    internal = list(number),
    external = list(number),
    protocol = list(string),
  })
}


variable "security_source" {
  type    = string
}
