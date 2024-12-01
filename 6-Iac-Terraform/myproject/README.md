### ### IaC Terraform practice, MongoDB Atlas

#### Creating Project, Claster, Database user, IP access list

```bash
# Copy or rename .env-example to .env
cp .env-example .env
# Add credentials info
vi .env
# Set credential variables for the current terminal session
. init-credentials.sh
# Play with terraform
terraform init
terraform plan
terraform apply
```
