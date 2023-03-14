variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "location" {
  description = "Location"
  type        = string
  default     = ""
}

variable "natGWIPName" {
  description = "NAT Gateway Public IP"
  type        = string
  default     = ""
}

variable "natGWName" {
  description = "NAT Gateway Public IP"
  type        = string
  default     = ""
}

variable "pip_prefix" {
  description = "Public IP prefix name"
  type        = string
  default     = ""
}

variable "subnet-name" {
  description = "Subnet Name"
  type        = string
  default     = ""
}

variable "vnet-rg-name" {
  description = "VNET RG NAME"
  type        = string
  default     = ""
}

variable "vnet-name" {
  description = "VNET Name"
  type        = string
  default     = ""
}