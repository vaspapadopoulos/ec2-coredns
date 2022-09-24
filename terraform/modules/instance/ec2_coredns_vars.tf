variable "name" {
  type = string
}

variable "instance_type" {
  type = string

  validation {
    error_message = "Invalid instance type."
    condition     = contains(
      [
        "t3.micro"
      ],
      var.instance_type)
  }
}

variable "key_name" {
  type = string
}
