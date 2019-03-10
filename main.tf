provider "oci" {
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

module "network" {
  source                     = "./modules/network"
  vcn_cidr_block             = "${var.vcn_cidr_block}"
  compartment_id             = "${var.compartment_id}"
  display_name               = "${var.display_name}"
  subnet_cidr_block          = "${var.subnet_cidr_block}"
  subnet_availability_domain = "${var.subnet_availability_domain}"
}

module "instances" {
  source                       = "./modules/instances"
  instance_subnet_id           = "${module.network.subnet_id}"
  compartment_id               = "${var.compartment_id}"
  instance_display_name        = "${var.instance_display_name}"
  instance_availability_domain = "${var.subnet_availability_domain}"
  shape                        = "${var.shape}"
  instance_image               = "${var.instance_image}"
  ssh_public_key               = "${var.ssh_public_key}"
  ssh_private_key              = "${var.ssh_private_key}"
  volume_display_name          = "${var.volume_display_name}"
}
