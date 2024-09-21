resource "oci_identity_compartment" "compartmentmodule" {
  provider       = oci.homeregion
  name           = var.compartment_name
  description    = "${var.compartment_name} - built by automation"
  compartment_id = var.compartment_ocid
}

module "virtualnetwork" {
  source         = "/root/terrcode/module/network"
  compartment_id = oci_identity_compartment.compartmentmodule.id
  VCN-CIDR       = var.VCN-CIDR
  service_ports  = var.service_ports
}

module "virtualsubnet" {
  source           = "/root/terrcode/module/subnet"
  Subnet-CIDR      = var.Subnet-CIDR
  subnetkind       = var.subnetkind
  compartment_id   = oci_identity_compartment.compartmentmodule.id
  vcn_id           = module.virtualnetwork.output_vcn_id
  rt_id            = module.virtualnetwork.output_tirt
  sl_id            = module.virtualnetwork.output_tisl
  isprivate_subnet = var.isprivate_subnet
}

module "virtualsubnet_public" {
  source           = "/root/terrcode/module/subnet"
  Subnet-CIDR      = var.Subnet-public-CIDR
  subnetkind       = "public"
  compartment_id   = oci_identity_compartment.compartmentmodule.id
  vcn_id           = module.virtualnetwork.output_vcn_id
  rt_id            = module.virtualnetwork.output_tirt
  sl_id            = module.virtualnetwork.output_tisl
  isprivate_subnet = false
}

module "standalonevm" {
  source                  = "/root/terrcode/module/compute"
  availablity_domain_name = var.availablity_domain_name == "" ? lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name") : var.availablity_domain_name
  compartment_id          = oci_identity_compartment.compartmentmodule.id
  computedisplayname      = var.computedisplayname
  computeshape            = var.computeshape
  subnet_id               = module.virtualsubnet.output_subnet_id
}
