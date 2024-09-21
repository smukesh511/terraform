variable "compartment_id" {
  type = string
}

variable "Subnet-CIDR" {
  type = string
}

variable "subnetkind" {
  type = string
}
variable "isprivate_subnet" {
  type = bool
  default = false 
}
variable "vcn_id" {
  type = string
}

variable "rt_id" {
 type = string
}

variable "sl_id" {
 type = string
}
