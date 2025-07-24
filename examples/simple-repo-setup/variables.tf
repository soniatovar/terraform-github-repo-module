variable "github_token" {
    description = "GitHub personal access token (classic)"
    type        = string
    sensitive   = true
}

variable "github_owner" {
    description = "GitHub username (or organization)"
    type        = string 
}