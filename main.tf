terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

variable "github_token" {
  type      = string
  sensitive = true
}

provider "github" {
  token = var.github_token
  owner = "JordanPio"
}

resource "github_branch_protection" "main" {
  repository_id = "terraform-github-test"
  pattern       = "main"

  required_status_checks {
    strict   = true
    contexts = ["Run Dummy CI", "Lint Code"]
  }


  enforce_admins = true
}