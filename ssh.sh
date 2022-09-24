#!/bin/bash

set -eu

HOST=$(terraform -chdir=./terraform output -json | jq -r '.ip_list.value[0]')
USER=$(terraform -chdir=./terraform output -json | jq -r '.ssh_user_list.value[0]')
PRIVATE_KEY="${PRIVATE_KEY:-~/.ssh/ec2_coredns}"

trap "ssh-agent -k" EXIT

eval $(ssh-agent -s)
ssh-add ~/.ssh/ec2_coredns
ssh -i "${PRIVATE_KEY}" "${USER}@${HOST}" -- "$@"
