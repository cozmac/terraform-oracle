resource "oci_core_vcn" "test_vcn" {
  cidr_block     = "${var.vcn_cidr_block}"
  compartment_id = "${var.compartment_id}"
  display_name   = "${var.display_name}"
  dns_label      = "${var.display_name}"
}

resource "oci_core_internet_gateway" "test_internet_gateway" {
  compartment_id = "${var.compartment_id}"
  vcn_id         = "${oci_core_vcn.test_vcn.id}"
  display_name   = "${var.display_name}-ig"
}

resource "oci_core_route_table" "test_route_table" {
  #Required
  compartment_id = "${var.compartment_id}"

  route_rules {
    network_entity_id = "${oci_core_internet_gateway.test_internet_gateway.id}"

    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }

  vcn_id = "${oci_core_vcn.test_vcn.id}"

  display_name = "${var.display_name} - rt"
}

resource "oci_core_security_list" "test_security_list" {
  compartment_id = "${var.compartment_id}"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol = "all"
    source   = "0.0.0.0/0"
  }

  vcn_id = "${oci_core_vcn.test_vcn.id}"

  display_name = "${var.display_name} - sl"
}

resource "oci_core_subnet" "test_subnet" {
  cidr_block          = "${var.subnet_cidr_block}"
  compartment_id      = "${var.compartment_id}"
  security_list_ids   = ["${oci_core_security_list.test_security_list.id}"]
  vcn_id              = "${oci_core_vcn.test_vcn.id}"
  dns_label           = "${var.display_name}sb"
  availability_domain = "${var.subnet_availability_domain}"
  display_name        = "${var.display_name} - SBNET"
  route_table_id      = "${oci_core_route_table.test_route_table.id}"
}
