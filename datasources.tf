# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Gets a list of vNIC attachments on the AppAD1 
data "oci_core_vnic_attachments" "AppAD1Vnics" {
  compartment_id = "${var.compartment_ocid}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  instance_id = "${oci_core_instance.AppAD1.id}"
} 

# Gets the OCID of the first (default) vNIC on the bastion host
data "oci_core_vnic" "AppAD1Vnic" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.AppAD1Vnics.vnic_attachments[0],"vnic_id")}"
}
