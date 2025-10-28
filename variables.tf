variable "us_east_1_instance_count" {
  description = "Number of Graviton instances in US-East-1"
  type        = number
  default     = 3
}

variable "us_west_2_instance_count" {
  description = "Number of x86 instances in US-West-2"
  type        = number
  default     = 2
}

variable "ap_south_1_instance_count" {
  description = "Number of x86 instances in AP-South-1"
  type        = number
  default     = 4
}

variable "graviton_instance_type" {
  description = "Instance type for Graviton instances"
  type        = string
  default     = "t4g.medium"
}

variable "x86_instance_type_medium" {
  description = "Instance type for x86 medium instances"
  type        = string
  default     = "t3.medium"
}

variable "x86_instance_type_large" {
  description = "Instance type for x86 large instances"
  type        = string
  default     = "t3.large"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "production"
}
