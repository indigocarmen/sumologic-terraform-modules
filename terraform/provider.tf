terraform {
    required_providers {
        sumologic = {
            source = "sumologic/sumologic"
            version = "2.9.10" # set the Sumo Logic Terraform Provider version
        }
    }
    required_version = ">= 0.13"
}

# Setup authentication variables. See "Authentication" section for more details.
# https://registry.terraform.io/providers/SumoLogic/sumologic/latest/docs#authentication
