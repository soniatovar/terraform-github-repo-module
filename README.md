# terraform-github-repo-module

This Terraform module was built to manage GitHub repositories through code. It creates a new repository, sets the default branch, adds tpics, and optionally applies branch protection rules. It is designed for **personal GitHub accounts** but can be used with organizations as well, with some minor adjustments (set `github_owner` to the org name)

---

## What This Module Does

- Creates a GitHub repository with:
  - Name, description, topics, visibility, and default branch
- Optional branch protection rules, including:
  - Require pull requests before merging
  - Require at least one approval
  - Enforces conversation resolution
  - (Status checks are optional)

---

## Inputs


| Variable                  | Description                                            | Required | Default     |
|---------------------------|--------------------------------------------------------|----------|-------------|
| `github_token`            | GitHub Personal Access Token with repo permissions     |  Yes   | —           |
| `github_owner`            | GitHub username (or org name if you're using one)      |  Yes   | —           |
| `repo_name`               | Name of the new repository                             |  Yes   | —           |
| `repo_description`        | Description of the repo                                | No       | `""`        |
| `visibility`              | `"private"` or `"public"`                              | No       | `"private"` |
| `topics`                  | List of topic strings for the repo                     | No       | `[]`        |
| `default_branch`          | Name of the default branch                             | No       | `"main"`    |
| `enable_branch_protections` | Whether to apply branch protection rules             | No       | `false`     |
| `require_approvals`       | If branch protection is enabled, require 1 approval    | No       | `false`     |


---

## Outputs

| Name            | Description                                 |
|------------------|---------------------------------------------|
| `repo_id`        | The repository's node ID                   |
| `repo_url`       | Git clone URL (HTTPS)                      |
| `html_url`       | Web URL of the GitHub repository           |

---

## Local Testing Example

Inside the `examples/simple-repo-setup/main.tf` folder:

```hcl
provider "github" {
  token = var.github_token
  owner = var.github_owner
}

module "repo" {
  source = "../../"

  github_token                = var.github_token
  github_owner                = var.github_owner
  repo_name                   = "test-terraform-repo"
  repo_description            = "Test repository created using the Terraform GitHub module"
  visibility                  = "private"
  topics                      = ["terraform", "github", "example"]
  default_branch              = "main"
  enable_branch_protections   = true
  require_approvals           = true
}

output "test_repo_url" {
  value = module.repo.repo_url
}
```

Create a `terraform.tfvars` file (not committed):

```hcl
github_token = "your_token_here"
github_owner = "your_github_username"
```

Run it with:

```bash
terraform init
terraform plan
terraform apply
```

## Notes

- `.gitignore` the `terraform.tfvars` and `.terraform/` folders.
- Optionally switch to `github_branch_default` to avoid the deprecation warning for `default_branch`.

## About This Module

This repository was created as part of a personal project to better understand Terraform modules and GitHub automation.

## References

- https://registry.terraform.io/providers/integrations/github/latest/docs
- https://developer.hashicorp.com/terraform/language
- https://developer.hashicorp.com/terraform/language/modules/develop
- https://cli.github.com/manual/
