terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.0.0"
    }
  }
}

variable "github_token" {
  type      = string
  sensitive = true
}

provider "github" {
  token = var.github_token
  owner = "Test-Account-work"
}

resource "github_branch_protection_v3" "main" {
  repository  = "terraform-github-test"
  branch      = "main"
  enforce_admins = true

  required_status_checks {
    strict   = true
    checks = ["Run Dummy CI", "Lint Code"]
  }

  required_pull_request_reviews {
    bypass_pull_request_allowances {
      users = ["JordanPio"]
    }
  }
}