# Output the private and public IPs of the instance

output "AppAD1PublicPrivateIP" {
value = ["${data.oci_core_vnic.AppAD1Vnic.public_ip_address}"]
value = ["${data.oci_core_vnic.AppAD1Vnic.private_ip_address}"]
}