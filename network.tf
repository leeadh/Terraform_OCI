resource "oci_core_virtual_network" "multi_tier" {
  cidr_block = "${var.VPC-CIDR}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "multi_tier"
  dns_label      = "demo"
}

resource "oci_core_internet_gateway" "multi_tier" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "multi_tier"
    vcn_id = "${oci_core_virtual_network.multi_tier.id}"
}

resource "oci_core_route_table" "multi_tier" {
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_virtual_network.multi_tier.id}"
    display_name = "multi_tier"
    route_rules {
        cidr_block = "0.0.0.0/0"
        network_entity_id = "${oci_core_internet_gateway.multi_tier.id}"
    }
}

resource "oci_core_security_list" "PublicSubnet" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "Public"
    vcn_id = "${oci_core_virtual_network.multi_tier.id}"
    egress_security_rules = [{
	tcp_options {
	     "max" = 27017
	     "min" = 27017
	} 
        destination = "${var.VPC-CIDR}"
        protocol = "6"
    }]
    ingress_security_rules = [{
        tcp_options {
            "max" = 80
            "min" = 80
        }
        protocol = "6"
        source = "0.0.0.0/0"
    },
	{
        tcp_options {
            "max" = 22
            "min" = 22
        }
        protocol = "6"
        source = "0.0.0.0/0"
    },
  {

    icmp_options {
        "type" =3
        "type" =4

    }
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true

  }


    ]
}


resource "oci_core_subnet" "PublicSubnetAD1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  cidr_block = "${var.PubSubnetAD1CIDR}"
  display_name = "PublicSubnetAD1"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.multi_tier.id}"
  route_table_id = "${oci_core_route_table.multi_tier.id}"
  security_list_ids = ["${oci_core_security_list.PublicSubnet.id}"]
  dhcp_options_id = "${oci_core_virtual_network.multi_tier.default_dhcp_options_id}"
  dns_label      = "publicad1"
}


