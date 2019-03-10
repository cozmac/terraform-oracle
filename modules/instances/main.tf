resource "oci_core_instance" "test_instance" {
  availability_domain = "${var.instance_availability_domain}"
  compartment_id      = "${var.compartment_id}"
  shape               = "${var.shape}"

  create_vnic_details {
    subnet_id      = "${var.instance_subnet_id}"
    hostname_label = "${var.instance_display_name}"
  }

  display_name = "${var.instance_display_name}"

  metadata {
    ssh_authorized_keys = "${file(var.ssh_public_key)}"
  }

  source_details {
    source_id   = "${var.instance_image}"
    source_type = "image"
  }

  preserve_boot_volume = false
}

resource "null_resource" "installhttpd" {
  depends_on = ["oci_core_instance.test_instance"]

  provisioner "remote-exec" {
    script = "${path.module}/../../userdata/http.sh"

    connection {
      type        = "ssh"
      user        = "opc"
      host        = "${oci_core_instance.test_instance.public_ip}"
      port        = 22
      private_key = "${file(var.ssh_private_key)}"
    }
  }
}

resource "oci_core_volume" "test_volume" {
  availability_domain = "${var.instance_availability_domain}"
  compartment_id      = "${var.compartment_id}"
  display_name        = "${var.volume_display_name}"
  size_in_gbs         = "50"
}

resource "oci_core_volume_attachment" "test_volume_attachment" {
  attachment_type = "iscsi"
  instance_id     = "${oci_core_instance.test_instance.id}"
  volume_id       = "${oci_core_volume.test_volume.id}"
}
