terraform {
  backend "remote" {
    organization = "vaspapadopoulos"

    workspaces {
      name = "ec2-coredns"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "instance" {
  source    = "./modules/instance"
  providers = {
    aws = aws
  }
  depends_on = [
    module.key_pair
  ]
  for_each = var.instances

  name = each.key
  instance_type = each.value.instance_type
  key_name = each.value.key_name
}

module "key_pair" {
  source    = "./modules/key_pair"
  providers = {
    aws = aws
  }
  for_each = var.key_pairs

  key_name = each.value.key_name
  public_key = each.value.public_key
}

output "ip_list" {
  value = [for instance in module.instance: instance.ip]
}

output "ssh_user_list" {
  value = [for instance in module.instance: instance.ssh_user]
}
