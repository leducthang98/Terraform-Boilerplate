# Common variables
variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "account_id" {
  type        = string
  description = "Account ID"
}

variable "aws-profile-name" {
  type        = string
  description = "Credential profile AWS to use cli"
}

# VPC variables
variable "vpc_cidr" {
  type        = string
  description = "The IP range to use for the VPC"
}

variable "public_subnet_numbers" {
  type = map(number)
}

variable "private_subnet_numbers" {
  type = map(number)
}

# Pipeline
variable "git_connection_arn" {
  type = string
}

variable "git_repository" {
  type = string
}

variable "branch" {
  type = string
}

variable "buildspec_url" {
  type = string
}
