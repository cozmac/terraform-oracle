variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaavc2dsibk7elt7hllxgumljsmd5gorkmy5bkcu4s7rykuiydla4vq"
}

variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaac6l5ppbgtww3lbprvqbiteh4i7tkdll2cwj57g5ilmfceiwdtnqa"
}

variable "fingerprint" {
  default = "b0:73:fb:34:c7:fa:e6:00:ce:2a:49:fe:87:d9:0b:f9"
}

variable "private_key_path" {
  default = "/root/.oci/oci_api_key.pem"
}

variable "region" {
  default = "eu-frankfurt-1"
}

variable "vcn_cidr_block" {
  default = "10.0.0.0/16"
}

variable "compartment_id" {
  default = "ocid1.compartment.oc1..aaaaaaaapoh2h4hiamdidyertbl6cjzxj5whfkdbuxpsgablmd3g3uvaa6pq"
}

variable "display_name" {
  default = "myvcn"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/28"
}

variable "subnet_availability_domain" {
  default = "YJMa:EU-FRANKFURT-1-AD-1"
}

variable "shape" {
  default = "VM.Standard2.1"
}

variable "ssh_public_key" {
  default = "/root/.ssh/id_rsa.pub"
}

variable "instance_display_name" {
  default = "sarpeinstance"
}

variable "instance_image" {
  default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaajscyriqmukax7k5tgayq6g26lolscurrcphc4bofty6i6gmq2x2q"
}

variable "ssh_private_key" {
  default = "/root/.ssh/id_rsa"
}

variable "volume_display_name" {
  default = "blockstorage_test"
}
