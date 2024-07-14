# This resource is used to enable the GCP API for the project
resource "google_project_service" "required_apis" {
  for_each = toset([
    "compute.googleapis.com",              # For VPC and networking
    "run.googleapis.com",                  # For Cloud Run
    "vpcaccess.googleapis.com",            # For VPC access connector (if needed for Cloud Run)
    "servicenetworking.googleapis.com",    # For VPC peering and private services
    "cloudresourcemanager.googleapis.com", # For project-level operations
    "iam.googleapis.com",                  # For IAM permissions
  ])

  project = var.gcp_project
  service = each.key

  disable_dependent_services = true
  disable_on_destroy         = false
}

# Resource for creating a VPC network
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

# Resource for creating subnets within the VPC network
resource "google_compute_subnetwork" "subnets" {
  count         = length(var.subnet_cidrs)
  name          = "subnet-${count.index + 1}"
  ip_cidr_range = var.subnet_cidrs[count.index]
  network       = google_compute_network.vpc.id
  region        = var.gcp_region
}


# Resource for creating a Cloud Run service
resource "google_cloud_run_service" "service" {
  depends_on = [google_project_service.required_apis]
  name       = var.service_name
  location   = var.gcp_region

  template {
    spec {
      containers {
        image = var.container_image
        resources {
          limits = {
            memory = var.memory_limit
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Resource for creating a VPC access connector
resource "google_vpc_access_connector" "connector" {
  name          = "vpc-access"
  ip_cidr_range = "10.8.0.0/28"
  network       = google_compute_network.vpc.name
}

# Resource for granting IAM permissions to the Cloud Run service
resource "google_cloud_run_service_iam_member" "run_invoker" {
  service  = google_cloud_run_service.service.name
  location = google_cloud_run_service.service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
