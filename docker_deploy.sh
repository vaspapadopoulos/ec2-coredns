#!/bin/bash

set -eu

HOST=$(terraform -chdir=./terraform output -json | jq -r '.ip_list.value[0]')
USER=$(terraform -chdir=./terraform output -json | jq -r '.ssh_user_list.value[0]')
PRIVATE_KEY="${PRIVATE_KEY:-~/.ssh/ec2_coredns}"

DOCKER_HOST="ssh://${USER}@${HOST}"

CONTEXT_EXISTS=$(docker context ls  --format "{{ .Name }}" | grep --fixed-strings --line-regexp ec2-coredns | wc --lines)

if [ "${CONTEXT_EXISTS}" == "1" ]; then
  echo "Updating Docker context..."
  docker context update ec2-coredns \
    --docker "host=${DOCKER_HOST}"
else
  echo "Creating Docker context..."
  docker context create ec2-coredns \
  --description "Docker context for EC2 instance running CoreDNS" \
  --docker "host=${DOCKER_HOST}"
fi

trap "ssh-agent -k" EXIT

eval $(ssh-agent -s)
ssh-add ~/.ssh/ec2_coredns
docker --context ec2-coredns compose --project-directory=./docker up -d --build "$@"
