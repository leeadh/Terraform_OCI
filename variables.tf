
# change tenancy_ocid, user_ocid, fingerprint, compartment_ocid

variable "tenancy_ocid" {
	default = "ocid1.tenancy.oc1..aaaaaaaasvfalhy6kqzeduyqjia5fasjfqtligqrfdo27tfejilfy26nefja"
}
variable "user_ocid" {
	default = "ocid1.user.oc1..aaaaaaaagqr5vdxvhtp4xack6xi7j3b2cktprjyrgnn7hixvybzdq5hopllq"
}
variable "fingerprint" {
	default = "55:ab:2b:4d:65:3e:71:a9:37:f4:ff:28:e4:e7:d4:86" 
}
variable "private_key_path" {
	default = "./Keys/oci_api_key.pem" 
}

variable "private_key_password" {
	default  = "o"
}

variable "region" {
	default = "us-ashburn-1" 
}

variable "compartment_ocid" {
	default = "ocid1.compartment.oc1..aaaaaaaajepbwnvdhise6mblvjj3zicvj77yir77xibrfcwtg3asnavcc7pa"
}
variable "ssh_private_key" {
  description = "File location of the ssh private key"
  default     = "./keys/PrivateKey.pem"
}

variable ssh_public_key_file {
  description = "File location of the ssh public key"
  default     = "./keys/PublicKey.pub"
}


variable "AppShape" {
    default = "VM.Standard1.1"
}

variable "InstanceImageOCID" {
    type = "map"
    default = {
        // Oracle-provided image "Oracle-Linux-7.4-2017.12.18-0"
        // See https://docs.us-phoenix-1.oraclecloud.com/Content/Resources/Assets/OracleProvidedImageOCIDs.pdf
        us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaasc56hnpnx7swoyd2fw5gyvbn3kcdmqc2guiiuvnztl2erth62xnq"
        us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaaxrqeombwty6jyqgk3fraczdd63bv66xgfsqka4ktr7c57awr3p5a"
        eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaayxmzu6n5hsntq4wlffpb4h6qh6z3uskpbm5v3v4egqlqvwicfbyq"
    }
}

variable "VPC-CIDR" {
    default = "10.0.0.0/25"
}

variable "PubSubnetAD1CIDR" {
    default = "10.0.0.0/28"
}


variable "AppBootStrap" {
    default = "./userdata/App"
}

