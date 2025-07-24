# Unique Node ID for resources
output "repo_id" {
    description = "The ID of the created GitHub repository"
    value       = github_repository.repo.node_id
}

# Used by Git Clone or CLI
output "repo_url" {
    description = "The Git clone URL of the repository"
    value       = github_repository.repo.git_clone_url
}

# Web URL
output "html_url" {
    description = "The web URL of the created GitHub repository"
    value       = github_repository.repo.html_url
}