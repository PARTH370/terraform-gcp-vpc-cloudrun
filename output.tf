# Output for VPC network name
output "vpc_network_name" {
  value = google_compute_network.vpc.name
}

# Output for subnet names
output "subnet_names" {
  value = [for subnet in google_compute_subnetwork.subnets : subnet.name]
}

# Output for service name
output "service_name" {
  value = google_cloud_run_service.service.name
}

# Output for service URL
output "service_url" {
  value = google_cloud_run_service.service.status[0].url
}

# Output for VPC access connector name
output "vpc_access_connector_name" {
  value = google_vpc_access_connector.connector.name
}