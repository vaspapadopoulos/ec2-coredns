#!/bin/bash

set -eu

HOST=$(terraform -chdir=./terraform output -json | jq -r '.ip_list.value[0]')
USER=$(terraform -chdir=./terraform output -json | jq -r '.ssh_user_list.value[0]')
PRIVATE_KEY="${PRIVATE_KEY:-~/.ssh/ec2_coredns}"

ansible-playbook \
  -u "${USER}" \
  -i "${HOST}," \
  --private-key ${PRIVATE_KEY} \
  --extra-vars "@ansible/vars/docker.yml" \
  --extra-vars "@ansible/vars/sshd.yml" \
  --extra-vars "@ansible/vars/ufw.yml" \
  ansible/server.yml
