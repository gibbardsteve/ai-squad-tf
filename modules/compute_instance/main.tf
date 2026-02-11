resource "google_compute_disk" "data" {
  project = var.project_id
  name    = "${var.name}-data"
  type    = var.data_disk_type
  zone    = var.zone
  size    = var.data_disk_size_gb
  labels  = var.labels
}

resource "google_compute_instance" "vm" {
  project      = var.project_id
  name         = var.name
  zone         = var.zone
  machine_type = var.machine_type

  tags   = var.tags
  labels = var.labels

  deletion_protection = var.deletion_protection

  boot_disk {
    initialize_params {
      image = var.boot_image
      size  = var.boot_disk_size_gb
      type  = var.boot_disk_type
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    dynamic "access_config" {
      for_each = var.enable_public_ip ? [1] : []
      content {}
    }
  }

  # Security hardening defaults (safe baseline)
  metadata = {
    enable-oslogin         = "TRUE"
    block-project-ssh-keys = "TRUE"
  }

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  dynamic "service_account" {
    for_each = var.service_account_email == null ? [] : [1]
    content {
      email  = var.service_account_email
      scopes = var.service_account_scopes
    }
  }

  lifecycle {
    ignore_changes = [
      attached_disk,
    ]
  }
}

resource "google_compute_attached_disk" "data_attach" {
  project  = var.project_id
  zone     = var.zone
  instance = google_compute_instance.vm.name
  disk     = google_compute_disk.data.name
}