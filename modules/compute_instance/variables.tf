variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "name" {
  type        = string
  description = "Instance name"
}

variable "zone" {
  type        = string
  description = "Instance zone"
}

variable "machine_type" {
  type        = string
  description = "GCE machine type"
}

variable "network" {
  type        = string
  description = "VPC network self_link or name"
  default     = "default"
}

variable "subnetwork" {
  type        = string
  description = "Optional subnetwork self_link or name"
  default     = null
}

variable "boot_image" {
  type        = string
  description = "Boot image (family or specific image). Example: debian-cloud/debian-12"
  default     = "debian-cloud/debian-12"
}

variable "boot_disk_size_gb" {
  type        = number
  description = "Boot disk size in GB"
  default     = 30
}

variable "boot_disk_type" {
  type        = string
  description = "Boot disk type"
  default     = "pd-balanced"
}

variable "data_disk_size_gb" {
  type        = number
  description = "Persistent data disk size in GB"
  default     = 100
}

variable "data_disk_type" {
  type        = string
  description = "Persistent data disk type"
  default     = "pd-balanced"
}

variable "tags" {
  type        = list(string)
  description = "Network tags"
  default     = []
}

variable "labels" {
  type        = map(string)
  description = "Resource labels"
  default     = {}
}

variable "enable_public_ip" {
  type        = bool
  description = "If true, attach an ephemeral external IP"
  default     = false
}

variable "service_account_email" {
  type        = string
  description = "Optional service account email to attach to the VM"
  default     = null
}

variable "service_account_scopes" {
  type        = list(string)
  description = "Scopes for the attached service account (if any)"
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "deletion_protection" {
  type        = bool
  description = "Prevent accidental deletion"
  default     = false
}