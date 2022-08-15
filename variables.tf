variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment Tag"
  type        = string
  default     = "prod"
}

variable "owner" {
  description = "Owner Tag"
  type        = string
  default     = "juned.memon"
}

variable "project" {
  description = "Project Tag"
  type        = string
  default     = "K3s"
}

variable "aws_ssh_key_name" {
  type        = string
  description = "SSH key to attach to nodes"
}

variable "security_group_id" {
  type        = string
  description = "security_group_id to attach the VM to"
}

variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = "t3.micro"
}

variable "schedule" {
  description = "instance_schedule"
  type        = string
  default     = "on=(M,01);off=(F,23);tz=ist"
}