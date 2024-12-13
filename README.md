Opentofu/Terraform repo for AWS general iamadmin

repo/
├── main.tf                # Root module for high-level orchestration
├── variables.tf           # Shared/global variables
├── outputs.tf             # Shared/global outputs
├── terraform.tfvars       # Global default variable values
├── workflows/             # Workflow-specific modules
│   ├── data-analytics/    # Infrastructure for data analytics workflows
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── vms-with-vpc-peering/ # Infrastructure for VMs with VPC peering
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── k8s-cluster/       # Kubernetes cluster for three-tier web apps
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
├── modules/               # Reusable submodules
│   ├── networking/        # Networking resources (e.g., VPCs, subnets)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── compute/           # Compute resources (e.g., EC2 instances)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── s3/                # S3 bucket resources
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
├── .gitignore             # Exclude sensitive files and state files
└── .terraform.lock.hcl    # Lock file for consistent provider versions
