variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "impersonate_service_account" {
  description = "Service account email to impersonate for Terraform operations"
  type        = string
  default     = null
}

variable "network" {
  description = "server network"
  type        = string
}