# CodeBuild and CodePipeline
resource "aws_codebuild_project" "codebuild" {
  name         = "${var.env}-${var.project}-backend"
  service_role = var.role_codebuild

  artifacts {
    type = "CODEPIPELINE"
  }
  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    privileged_mode = true
    type            = "LINUX_CONTAINER"

    environment_variable {
      name  = "REGION"
      value = var.region
    }

    environment_variable {
      name  = "REPOSITORY_URL"
      value = var.repository_url
    }

    environment_variable {
      name  = "ACCOUNT_ID"
      value = var.account_id
    }
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = var.buildspec_url
  }
}

resource "aws_codepipeline" "pipeline" {
  name     = "${var.env}-${var.project}-backend"
  role_arn = var.role_codepipeline

  artifact_store {
    location = var.pipeline_bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      input_artifacts  = []
      output_artifacts = ["SourceArtifact"]
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      configuration = {
        ConnectionArn    = var.git_connection_arn
        FullRepositoryId = var.git_repository
        BranchName       = var.branch
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      configuration = {
        "ProjectName" = "${var.env}-${var.project}-backend"
      }

    }
  }

}
