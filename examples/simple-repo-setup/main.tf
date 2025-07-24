provider "github" {
    token = var.github_token
    owner = var.github_owner
}

# Calls the repo module to test
module "repo" {
    source = "../../"

    github_token            = var.github_token
    github_owner            = var.github_owner
    repo_name               = "test-terraform-repo"
    repo_description        = "Test repository created using the Terraform GitHub module"
    visibility              = "private"
    topics                  = ["terraform", "github", "example"]
    default_branch          = "main"
    enable_branch_protections = true
    require_approvals       = true
}

# Prints the outputs after creation
output "test_repo_url" {
    value = module.repo.repo_url
}