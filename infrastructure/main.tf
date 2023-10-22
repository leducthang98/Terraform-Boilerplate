provider "aws" {
  profile = var.aws-profile-name
  region  = var.region
}

terraform {
  // cloud service used in terraform
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }
  }

  // where terraform backend stored
  backend "s3" {
    bucket  = "thangld-terraform-backend-bucket"
    key     = "thangld-terraform-backend-key"
    profile = "thangle"
    region  = "ap-southeast-1"
  }
}

# VPC
module "vpc" {
  source                 = "./modules/vpc"
  project                = var.project
  env                    = var.env
  vpc_cidr               = var.vpc_cidr
  public_subnet_numbers  = var.public_subnet_numbers
  private_subnet_numbers = var.private_subnet_numbers
}

module "ecr" {
  source  = "./modules/ecr"
  env     = var.env
  project = var.project
}


module "pipeline_base" {
  source     = "./modules/pipeline-base"
  project    = var.project
  env        = var.env
  account_id = var.account_id
  region     = var.region
  vpc_id     = module.vpc.vpc_id
}

module "pipeline_backend" {
  source             = "./modules/pipeline-backend"
  project            = var.project
  env                = var.env
  region             = var.region
  account_id         = var.account_id
  git_connection_arn = var.git_connection_arn
  git_repository     = var.git_repository
  branch             = var.branch
  buildspec_url      = var.buildspec_url
  role_codebuild     = module.pipeline_base.role_codebuild
  role_codepipeline  = module.pipeline_base.role_codepipeline
  sg_pipeline        = module.pipeline_base.sg_pipeline
  repository_url     = module.ecr.repository_url_backend
  pipeline_bucket    = module.pipeline_base.pipeline_bucket
}