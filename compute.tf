
resource "oci_core_instance" "AppAD1" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
    compartment_id = "${var.compartment_ocid}"
    display_name = "AppAD1"
    image = "${var.InstanceImageOCID[var.region]}"
    shape = "${var.AppShape}"
    subnet_id = "${oci_core_subnet.PublicSubnetAD1.id}"
    metadata {
        ssh_authorized_keys = "${file(var.ssh_public_key_file)}"
	user_data = "${base64encode(file(var.AppBootStrap))}" 
    }
}
