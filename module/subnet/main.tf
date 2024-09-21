# Subnet
resource "oci_core_subnet" "tisubnet" {
  cidr_block        = var.Subnet-CIDR
  display_name      = "ti_${var.subnetkind}_subnet"
  dns_label         = "${var.subnetkind}"
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  prohibit_public_ip_on_vnic = var.isprivate_subnet
  route_table_id    = var.rt_id
  security_list_ids = [var.sl_id]
}
