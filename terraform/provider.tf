terraform {
    required_providers {
        sumologic = {
            source = "sumologic/sumologic"
            version = "" # set the Sumo Logic Terraform Provider version
        }
    }
    required_version = ">= 0.13"
}

# Setup authentication variables. See "Authentication" section for more details.
# https://registry.terraform.io/providers/SumoLogic/sumologic/latest/docs#authentication
variable "sumologic_access_id" {
    type = string
    description = "Sumo Logic Access ID"
}
variable "sumologic_access_key" {
    type = string
    description = "Sumo Logic Access Key"
    sensitive = true
}

# Configure the Sumo Logic Provider
provider "sumologic" {
    access_id   = "${var.sumologic_access_id}"
    access_key  = "${var.sumologic_access_key}"
    environment = "us2"
}