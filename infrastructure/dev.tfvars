# Common variables
aws-profile-name = "thangle"
region           = "ap-southeast-1"
env              = "development"
project          = "codese"
account_id       = "637836690395"

# VPC variables
vpc_cidr = "172.0.0.0/16"
public_subnet_numbers = {
  "ap-southeast-1a" = 1
  "ap-southeast-1b" = 2
  "ap-southeast-1c" = 3
}

private_subnet_numbers = {
  "ap-southeast-1a" = 4
  "ap-southeast-1b" = 5
  "ap-southeast-1c" = 6
}

git_connection_arn = "arn:aws:codestar-connections:ap-southeast-1:637836690395:connection/5a8e151b-d3b9-4356-9885-f8071a17e122"
git_repository     = "leducthang98/backend-terraform"
branch             = "master"
buildspec_url      = "buildspec.yaml"