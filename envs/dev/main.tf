# Add compute instance to run ai agent
module "ai_squad_server" {
  source = "../../modules/compute_instance"

  project_id   = var.project_id
  name         = "ai-squad-server"
  zone         = "europe-west2-a"
  machine_type = "n2d-standard-2"

  # If you want SSH via IAP / no public IP, keep this false
  enable_public_ip = false

  # Optional: if you have a custom VPC/subnet, set these.
  # network    = "default"
  # subnetwork = null

  data_disk_size_gb = 100

  labels = {
    env         = "dev"
    project     = "ai-agent"
    deployed_by = "terraform"
  }

  tags = ["ai-squad-server"]
}