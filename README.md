# ec2-coredns

[![Terraform](https://img.shields.io/badge/Terraform-1.2.6-7B42BC.svg?logo=terraform&logoColor=7B42BC)](https://www.terraform.io/)
[![Ansible](https://img.shields.io/badge/Ansible|PyPi-6.4.0-EE0000.svg?logo=ansible)](https://pypi.org/project/ansible/)
[![Docker](https://img.shields.io/badge/Docker-20.10.18-2496ED.svg?logo=docker&logoColor=2496ED)](https://www.docker.com/)

A CoreDNS Docker container deployed on an EC2 instance running Ubuntu.

- Terraform manages the EC2 instance.
- Ansible configures Ubuntu.
- Docker Compose is used to deploy the CoreDNS instance.
