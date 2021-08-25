variable "standard_name" {
    type = string
}

variable "standard_description" {
    type = string
}

variable "standard_folder" {
    type = string
}

variable "slack_webhook" {
    type = string
    default = null
}

variable "standard_trigger_type" {
    type = string
    default = "Critical"
}

variable "standard_query" {
    type = string
}

variable "slack_override" {
    type = string
    default = null
}
