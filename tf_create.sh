#!/bin/bash

set -eu

terraform -chdir=./terraform init
terraform -chdir=./terraform plan -input=false
terraform -chdir=./terraform apply -input=false -auto-approve
