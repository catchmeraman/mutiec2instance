output "us_east_1_instance_ids" {
  description = "Instance IDs for US-East-1 Graviton instances"
  value       = aws_instance.us_east_1_graviton[*].id
}

output "us_east_1_public_ips" {
  description = "Public IPs for US-East-1 instances"
  value       = aws_instance.us_east_1_graviton[*].public_ip
}

output "us_west_2_instance_ids" {
  description = "Instance IDs for US-West-2 instances"
  value       = aws_instance.us_west_2_x86[*].id
}

output "us_west_2_public_ips" {
  description = "Public IPs for US-West-2 instances"
  value       = aws_instance.us_west_2_x86[*].public_ip
}

output "ap_south_1_instance_ids" {
  description = "Instance IDs for AP-South-1 instances"
  value       = aws_instance.ap_south_1_x86[*].id
}

output "ap_south_1_public_ips" {
  description = "Public IPs for AP-South-1 instances"
  value       = aws_instance.ap_south_1_x86[*].public_ip
}

output "total_instance_count" {
  description = "Total number of instances across all regions"
  value       = length(aws_instance.us_east_1_graviton) + length(aws_instance.us_west_2_x86) + length(aws_instance.ap_south_1_x86)
}
