
# Path to the GCP service account key file
variable "gcp_svc_key" {
  description = "The path to the GCP service account key file"
  type        = string
}

# GCP project ID
variable "gcp_project" {
  description = "The GCP project ID"
  type        = string
}

# GCP region
variable "gcp_region" {
  description = "The GCP region"
  type        = string
}

# Name of the VPC to create
variable "vpc_name" {
  description = "The name of the VPC to create"
  type        = string
}

# CIDR block for the VPC
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "Must be a valid IPv4 CIDR block"
  }
}

# List of subnet CIDR ranges
variable "subnet_cidrs" {
  description = "List of subnet CIDR ranges"
  type        = list(string)
}

# Name of the Cloud Run service
variable "service_name" {
  description = "Name of the Cloud Run service"
  type        = string
}

# Container image to deploy
variable "container_image" {
  description = "Container image to deploy"
  type        = string
}

# Memory limit for the Cloud Run service
variable "memory_limit" {
  description = "Memory limit for the Cloud Run service"
  type        = string
  default     = "256Mi"
}