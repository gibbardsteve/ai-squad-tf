resource "google_compute_firewall" "allow_ssh_iap" {
  name    = "allow-ssh-from-iap"
  project = var.project_id
  network = var.network

  direction = "INGRESS"
  priority  = 1000

  # This is the commonly used range for IAP TCP forwarding
  source_ranges = ["35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["ai-squad-server"]
}