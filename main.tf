# Configure the Terraform runtime requirements.
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # Azure Resource Manager provider and version
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.3"
    }
  }
}

# Define providers and their config params
provider "azurerm" {
  features {}
}

provider "cloudinit" {
  # Configuration options
}

# Variables
variable "labelPrefix" {
  description = "Your college username, used as a prefix for resource names"
  type        = string
}

variable "region" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "eastus"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureadmin"
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "${var.labelPrefix}-A05-RG"
  location = var.region
}