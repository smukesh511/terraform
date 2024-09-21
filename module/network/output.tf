output "output_vcn_id" {
  value = oci_core_virtual_network.tivcn.id
}

output "output_tisl"  {
  value = oci_core_security_list.tisl.id
}

output "output_tirt" {
  value = oci_core_route_table.tiig_rt.id
}
