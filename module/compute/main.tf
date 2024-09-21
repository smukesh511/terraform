resource "oci_core_instance" "mycompute" {
  availability_domain        = var.availablity_domain_name
  compartment_id             = var.compartment_id
  display_name                        = var.computedisplayname
  freeform_tags                       = var.env_tags
  metadata = {
    ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtFKs9DOSZhNqTCiADwS+O2PGgsZELo+StM5xWbN2BHHJgzy3DKzjZ/AqzqervpoEcu8olGGynFrXrmkgsk2T8M3s833GDQxY3LwYN/DVLKXUwWj/jr0i9s7l15qQCW+WcPacl2Yfz2V9DMOS4dfVEsj82Fpo4wLBF4/wv94N8+XYxiS5Niqc0uo/WQh8DSFA87tp9tpsn3wKr+yTIXK18dLXUcrOwrIAxBSzPLQH2EEqT78U624o+FUSADzNUD3Pyj6TPxwRExMAtzhadvK2RRB7zn0xLwE7zkABBf897ZVHEQSvQIEbGHlSaNF/c1ugs6cSVagIvT5SpKzg1MVQZ ssh-key-2024-09-08"
  }
  shape                                   = var.computeshape
  state                                   = "RUNNING"
  agent_config {
    are_all_plugins_disabled = false
    is_management_disabled   = false
    is_monitoring_disabled   = false
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Oracle Java Management Service"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "OS Management Service Agent"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "OS Management Hub Agent"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Management Agent"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Custom Logs Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute RDMA GPU Monitoring"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Run Command"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Auto-Configuration"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Authentication"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Cloud Guard Workload Protection"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Block Volume Management"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
  }
  availability_config {
    is_live_migration_preferred = false
    recovery_action             = "RESTORE_INSTANCE"
  }
  create_vnic_details {
    assign_ipv6ip             = false
    assign_private_dns_record = false
    assign_public_ip          = false
    display_name           = "primary_vnic"
    freeform_tags          = var.env_tags
    hostname_label         = null
    skip_source_dest_check = false
    subnet_id              = var.subnet_id
  }
  instance_options {
    are_legacy_imds_endpoints_disabled = false
  }
  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "UEFI_64"
    is_consistent_volume_naming_enabled = true
    is_pv_encryption_in_transit_enabled = true
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }
  shape_config {
    baseline_ocpu_utilization = null
    memory_in_gbs             = 6
    ocpus                     = 1
    vcpus                     = 2
  }
  source_details {
    boot_volume_size_in_gbs         = jsonencode(100)
    boot_volume_vpus_per_gb         = jsonencode(10)
    is_preserve_boot_volume_enabled = false
    source_id                       = "ocid1.image.oc1.iad.aaaaaaaaraxxl6yrjswsxem67tmf4s3ihx44xbfq2ceqlp7rgcoroqinopfa"
    source_type                     = "image"
  }
}
