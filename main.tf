# Referencing Terraform GitHub provider documentation here:
# https://registry.terraform.io/providers/integrations/github/latest/docs
provider "github" {
    token = var.github_token
    owner = var.github_owner
}

# 'repo' used for a generic reusable module name; creates repo
resource "github_repository" "repo" {
    name            = var.repo_name
    description     = var.repo_description
    visibility      = var.visibility
    topics          = var.topics
    auto_init       = true
    has_issues      = true
    has_wiki        = false
    has_projects    = false
    default_branch  = var.default_branch
}

resource "github_branch_protection" "main" {
    count           = var.enable_branch_protections ? 1 : 0
    repository_id   = github_repository.this.node_id
    pattern         = var.default_branch

    required_pull_request_reviews {
        count       = var.require_approvals ? 1 : 0
        required_approving_review_count = 1
    }

    enforce_admins  = true
    require_conversation_resolution = true

    required_status_checks {
        strict      = false
        contexts    = []
    }
}