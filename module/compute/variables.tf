variable "availablity_domain_name" {
  type = string
}

variable "compartment_id" {
  type = string
}
variable "computedisplayname" {
  type = string
}
variable "env_tags" {
  type = map
  default =  { 
                 "env" = "dev"
             }
}

variable "computeshape" {
  type = string
}
variable "subnet_id" {
  type = string
}
