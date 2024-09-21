# All variables used by the automation.

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}
variable "availablity_domain_name" {
  default = ""
}

variable "VCN-CIDR" {
  default = "10.1.0.0/16"
}

variable "Subnet-CIDR" {
  default = "10.1.1.0/24"
}

variable "Subnet-public-CIDR" {
  default = "10.1.0.0/24"
}

variable "compartment_name" {
  type = string
}

variable "service_ports" {
  default = [80, 443, 22]
}

variable "isprivate_subnet" {
  type = bool
}

variable "subnetkind" {
  type = string
}

variable "computedisplayname" {
  type = string
}

variable "computeshape" {
  type    = string
  default = "VM.Standard.A2.Flex"
}
