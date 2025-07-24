variable "github_token" {
    description = "GitHub personal access token with repo permissions"
    type        = string
    sensitive   = true
}

variable "github_owner" {
    description = "The GitHub username or organization name that will own the repository"
    type        = string
}

variable "repo_name" {
    description = "The name of the GitHub repository"
    type        = string
}

variable "repo_description" {
    description = "Description of the GitHub repository"
    type        = string
    default     = ""
}

variable "visibility" {
    description = "Repository visibility, whether public or private"
    type        = string
    default     = "private"

    validation {
        condition = contains(["private", "public"], var.visibility)
        error_message = "Visibility must be private or public."
    }
}

variable "topics" {
    description = "A list of topics (tags) for the GitHub repository"
    type        = list(string)
    default     = []
}

# Set to 'main'
variable "default_branch" {
    description = "The default branch of the repository"
    type        = string
    default     = "main"
}

variable "enable_branch_protections" {
    description = "Whether to enable branch protection rules"
    type        = bool
    default     = false
}

variable "require_approvals" {
    description = "Whether to require at least one approval on pull requests"
    type        = bool
    default     = false
}