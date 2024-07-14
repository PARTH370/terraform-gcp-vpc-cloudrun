# Project Structure
.
├── infrastructure
│      ├── main.tf
│      ├── terraform.tfvars.example
│      ├── provider.tf
│      ├── variables.tf
│      ├── outputs.tf
│      └── README.md

- `main.tf`: The main Terraform configuration file
- `variables.tf`: The input variables for the Terraform configuration
- `outputs.tf`: The output variables for the Terraform configuration
- `terraform.tfvars.example`: An example file for the Terraform variables
- `provider.tf` : The provider configuration file 





# Step 1: Clone the repository
```bash
git clone
```

# Step 2: Create a new project in Google Cloud Platform
1. Go to the Google Cloud Console
2. Click on the project dropdown in the top navigation bar
3. Click on `New Project`
4. Enter a project name and click `Create`
5. Note the project ID for the next step

# Step 3: Create a new service account
1. Go to the Google Cloud Console
2. Click on the project dropdown in the top navigation bar
3. Click on `IAM & Admin`
4. Click on `Service Accounts`
5. Click on `Create Service Account`
6. Enter a name and description for the service account
7. Click `Create`
8. Click on `Select a role` and choose `Project > Editor`
9. Click `Continue`
10. Click `Done`
11. Click on the three dots on the right side of the service account row
12. Click `Manage keys`
13. Click `Add key` and choose `Create new key`
14. Choose `JSON` and click `Create`
15. Save the JSON file to your local machine
16. Note the path to the JSON file for the next step

# Step 4: Setup the variables in .tfvars file
```bash
cp terraform.tfvars.example terraform.tfvars
```

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| gcp_svc_key | Path to the service account key file | string | n/a | yes |
| gcp_project | The ID of the project in which resources will be managed | string | n/a | yes |
| gcp_region | The region in which resources will be created | string | n/a | yes |
| vpc_name | The name of the VPC to create | string | n/a | yes |
| vpc_cidr | The CIDR block for the VPC | string | n/a | yes |
| subnet_cidrs | List of subnet CIDR ranges | list(string) | n/a | yes |
| service_name | Name of the Cloud Run service | string | n/a | yes |
| container_image | Container image to deploy | string | n/a | yes |
| memory_limit | Memory limit for the Cloud Run service | n/a | n/a | yes |


# Step 5: Initialize Terraform
```bash
terraform init
```

# Step 6: Plan the Terraform configuration
```bash
terraform plan
```

# Step 7: Apply the Terraform configuration
```bash
terraform apply
```
## Output

| Name | Description |
|------|-------------|
| vpc_network_name | The name of the VPC network |
| subnet_names | The names of the subnets |
| service_name | The name of the Cloud Run service |
| service_url | The URL of the Cloud Run service |
| vpc_access_connector_name | The name of the VPC access connector |


# Step 8: Test the Cloud Run service
1. Go to the Google Cloud Console
2. Click on the project dropdown in the top navigation bar
3. Click on `Cloud Run`
4. Click on the service name
5. Click on the service URL to view the service



# Step 9: Cleanup
```bash
terraform destroy
```

## Resources
- [Cloud Run](https://cloud.google.com/run)
- [Terraform](https://www.terraform.io/)
- [Google Cloud SDK](https://cloud.google.com/sdk)
- [Google Cloud Console](https://console.cloud.google.com/)
- [Google Cloud API Library](https://console.cloud.google.com/apis/library)
- [Google Cloud Service Accounts](https://console.cloud.google.com/iam-admin/serviceaccounts)
- [Google Cloud SDK Installation](https://cloud.google.com/sdk/docs/install)
- [Google Cloud SDK Authentication](https://cloud.google.com/sdk/gcloud/reference/auth/login)
- [Terraform Google Cloud Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Terraform Google Cloud Run](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service)
- [Terraform Google Cloud Build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger)
- [Terraform Google Cloud Service Account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account)
- [Terraform Google Cloud IAM Binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_binding)
- [Terraform Google Cloud IAM Member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_member)
- [Terraform Google Cloud Project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project)
- [Terraform Google Cloud Project Service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service)
- [Terraform Google Cloud Project IAM Policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_policy)
- [Terraform Google Cloud Project Service Identity](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service_identity)
- [Terraform Google Cloud Project Service Identity Pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service_identity_pool)
