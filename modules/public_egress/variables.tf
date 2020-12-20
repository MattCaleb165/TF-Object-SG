variable "workspace" {
  description = "The workspace that is being used"
  type = string
}

variable "deployment_name" {
  description = "Resource to apply SG to (ie. Caleb_Testing)"
  type = string
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  description = "List of key/value pairs"
}