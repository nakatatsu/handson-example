# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a hands-on training repository for using Claude Code to generate production-quality Terraform modules following AWS Well-Architected Framework principles. All documentation and guidelines are written in Japanese.

## Essential Commands

### Module Development
- `make prepare module=<module_name>` - Create a new Terraform module skeleton
- `terraform fmt` - Format Terraform code
- `terraform init` - Initialize Terraform working directory
- `terraform validate` - Validate Terraform configuration
- `tflint --init --config <repository_root>/.tflint.hcl` - Initialize tflint
- `tflint --recursive --config <repository_root>/.tflint.hcl` - Run linting checks
- `checkov -d . --config-file <repository_root>/.checkov.yml` - Run security scans
- `terraform plan` - Create execution plan
- `terraform-docs markdown . --output-file README.md` - Generate module documentation

## Architecture and Development Workflow

### Standard 14-Step Module Development Process
When creating a new Terraform module, follow the standardized workflow defined in `documents/task_process.yaml`:

1. Create feature branch (`feat/add-new-module`)
2. Run `make prepare module=<name>` to create skeleton
3. Update module README.md based on `documents/module_requirements.yaml`
4. Update specification.yaml based on `documents/module_specification.yaml`
5. Generate Terraform code following `documents/module_code.yaml`
6. Update terraform.tfvars.json with required variables
7. Run `terraform fmt`
8. Run `terraform init` (fix all errors before proceeding)
9. Run `terraform validate` (fix all errors before proceeding)
10. Run `tflint` (fix all errors before proceeding)
11. Run `checkov` (fix all errors before proceeding)
12. Run `terraform plan` (fix all errors before proceeding)
13. Run `terraform-docs` to update documentation
14. Commit changes and create pull request

### Key Guidelines
- All Terraform modules must use version 1.12.1
- AWS provider version must be 5.97.0
- Backend configuration uses S3 with specific naming convention
- Default tags must include Project and Environment
- All modules must pass security scans and linting without errors
- Documentation must be created before code implementation
- Follow AWS Well-Architected Framework principles strictly

### Project Structure
- `documents/` - YAML specifications for development guidelines
- `helpers/` - Template files for new modules
- `scripts/` - Automation scripts
- `resouces_specification/` - Resource-specific rules and configurations
- Generated modules follow the pattern: `<module_name>/` with standard Terraform files

## Important Notes
- Never proceed to the next step if there are errors in the current step
- Always create documentation (README.md and specification.yaml) before writing code
- Use the provided templates and follow the established patterns
- All work should be done in feature branches with descriptive names
- This is a training environment - follow the process exactly as specified