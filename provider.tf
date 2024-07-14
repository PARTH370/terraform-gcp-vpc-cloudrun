# Purpose: This file is used to configure the Google Cloud provider.
provider "google" {
    credentials = file(var.gcp_svc_key)  # Path to the Google Cloud service account key file
    project = var.gcp_project
    region = var.gcp_region
}