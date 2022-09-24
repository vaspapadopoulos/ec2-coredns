aws_region = "eu-central-1"
instances  = {
  ec2-coredns = {
    instance_type = "t3.micro"
    key_name      = "coredns-keypair"
  }
}
key_pairs = {
  ec2-coredns = {
    key_name   = "coredns-keypair"
    public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII/g4XSXi2EA9Uuh5raGmU0d6O9uc5cIzO6Fa2b4bFPv"
  }
}
