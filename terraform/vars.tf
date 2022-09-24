variable "aws_region" {
  type = string
}

variable "instances" {
  type = map(object({
    instance_type = string
    key_name      = string
  }))
}

variable "key_pairs" {
  type = map(object({
    key_name   = string
    public_key = string
  }))
}
