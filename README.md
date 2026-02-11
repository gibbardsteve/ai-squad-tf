# ai-squad-tf

Terraform for the base resources associated with the ai-squad terraform.

## Example tfvars file

```bash
project_id                  = "GCP-PROJECT-NAME"
region                      = "RESOURCE-REGION"
impersonate_service_account = "SA-NAME@GCP-PROJECT-NAME-project-name.iam.gserviceaccount.com"
```

## Common Commands

Run terraform commands in the appropriate environment directory.

```bash
cd envs/dev
```

First time in the repo or provider change or backend tfstate change.

```bash
terraform init
```

Format terraform.

```bash
terraform fmt -recursive
```

Validate terraform.

```bash
terraform validate
```

Plan and apply terraform changes.

```bash
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

Destroy resources.

```bash
terraform destroy -var-file="dev.tfvars"
```
