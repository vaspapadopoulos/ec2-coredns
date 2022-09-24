#!/bin/bash

set -eu

trap "rm -f plan" EXIT

terraform -chdir=./terraform init
terraform -chdir=./terraform plan -input=false -destroy -out plan
terraform -chdir=./terraform apply -input=false -auto-approve plan
