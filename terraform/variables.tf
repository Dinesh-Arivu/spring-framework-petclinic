variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "key_name" {
  description = "Existing AWS key pair name for SSH access"
  type        = string
}

variable "public_key_path" {
  description = "Path to public key file (optional, leave empty to skip)"
  type        = string
  default     = ""
}


variable "instance_type" {
  type    = string
  default = "t3.micro" # approx 1 vCPU 1GB; for 2GB choose t3.small
}

variable "app_ami" {
  description = "AMI ID for app and db (Ubuntu 22.04)"
  default     = "ami-0bbdd8c17ed981ef9" # replace with a region-appropriate AMI
}
