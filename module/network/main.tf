# VCN
resource "oci_core_virtual_network" "tivcn" {
  cidr_block     = var.VCN-CIDR
  dns_label      = "TIDNS"
  compartment_id = var.compartment_id
  display_name   = "TIVCN"
}

# DHCP Options
resource "oci_core_dhcp_options" "tidhcp" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.tivcn.id
  display_name   = "TIDHCPOptions1"

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  options {
    type                = "SearchDomain"
    search_domain_names = ["ti.com"]
  }
}

# Internet Gateway
resource "oci_core_internet_gateway" "tiig" {
  compartment_id = var.compartment_id
  display_name   = "TIIG"
  vcn_id         = oci_core_virtual_network.tivcn.id
}

# Route Table
resource "oci_core_route_table" "tiig_rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.tivcn.id
  display_name   = "TIIG_RT"
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.tiig.id
  }
}

# Security List
resource "oci_core_security_list" "tisl" {
  compartment_id = var.compartment_id
  display_name   = "tisecuritylist"
  vcn_id         = oci_core_virtual_network.tivcn.id

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  dynamic "ingress_security_rules" {
    for_each = var.service_ports
    content {
      protocol = "6"
      source   = "0.0.0.0/0"
      tcp_options {
        max = ingress_security_rules.value
        min = ingress_security_rules.value
      }
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = var.VCN-CIDR
  }
}
