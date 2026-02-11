resource "google_compute_router" "egress_router" {
  name    = "ai-squad-egress-router"
  project = var.project_id
  region  = var.region
  network = var.network
}

resource "google_compute_router_nat" "egress_nat" {
  name                               = "ai-squad-egress-nat"
  project                            = var.project_id
  region                             = google_compute_router.egress_router.region
  router                             = google_compute_router.egress_router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}