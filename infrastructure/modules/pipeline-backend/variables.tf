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

variable "role_codebuild" {
  type = string
}

variable "role_codepipeline" {
  type = string
}

variable "sg_pipeline" {
  type = string
}

variable "pipeline_bucket" {
  type = string
}

variable "repository_url" {
  type = string
}