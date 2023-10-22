resource "aws_ecr_repository" "codese_backend_ecr" {
  name = "${var.env}-${var.project}-backend"
}

output "repository_url_backend" {
  value = aws_ecr_repository.codese_backend_ecr.repository_url
}