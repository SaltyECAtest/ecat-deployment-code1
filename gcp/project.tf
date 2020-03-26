variable "project_id" {}
variable "role_bindings" {}
variable "project_name" {}
variable "org_id" {}
variable "folder_id" {}
variable "billing_id" {}
variable "skip_delete" {}

resource "google_project" "project" {
 name            = var.project_name
 project_id      = var.project_id
 billing_account = var.billing_id
 folder_id       = var.folder_id
 skip_delete     = var.skip_delete
}

resource "google_project_service" "project" {
  project = google_project.project.project_id
  service = "compute.googleapis.com"
  disable_on_destroy = false
}

output "project_id" {
 value = google_project.project.project_id
}
