# mock - Terraform Infrastructure

Infrastructure as Code for mock using Terraform.

## Structure

```
IAC/
├── Environments/
│   └── dev/
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       └── variables.tfvars
└── Modules/
    └── (terraform modules)
```

## Deployed Resources

- Key Vault
- App Service

## Usage

This infrastructure is automatically deployed via GitHub Actions workflow.

### Manual Deployment

```bash
cd IAC/Environments/dev
terraform init
terraform plan -var-file=variables.tfvars
terraform apply -var-file=variables.tfvars
```

## Created by Terraform Setup Wizard

Generated on: 2026-02-11T21:13:59.331Z
