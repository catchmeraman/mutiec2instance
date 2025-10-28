# Multi-Region EC2 Deployment with Terraform

This Terraform configuration deploys EC2 instances across three AWS regions with mixed architectures for optimal performance and cost efficiency.

## Architecture

- **US-East-1**: 3x t3.micro (x86_64) instances
- **US-West-2**: 2x t3.medium (x86_64) instances  
- **AP-South-1**: 4x t3.large (x86_64) instances

**Total: 9 instances across 3 regions**

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0 installed
- IAM permissions for EC2 instance management across regions

## Quick Start

1. **Clone and setup**:
   ```bash
   git clone <your-repo-url>
   cd terraform-multi-region-ec2
   ```

2. **Configure variables**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars as needed
   ```

3. **Deploy**:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Configuration

### Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `us_east_1_instance_count` | Graviton instances in US-East-1 | 3 |
| `us_west_2_instance_count` | x86 instances in US-West-2 | 2 |
| `ap_south_1_instance_count` | x86 instances in AP-South-1 | 4 |
| `graviton_instance_type` | Graviton instance type | t4g.medium |
| `x86_instance_type_medium` | x86 medium instance type | t3.medium |
| `x86_instance_type_large` | x86 large instance type | t3.large |

### Outputs

- Instance IDs and public IPs for each region
- Total instance count across all regions

## Cost Optimization

- **Graviton instances** in US-East-1 provide 20-40% better price-performance
- **Mixed instance types** optimized for different workload requirements
- **Multi-region deployment** for high availability and latency optimization

## Management Commands

```bash
# View current state
terraform show

# Update instance counts
terraform apply -var="us_east_1_instance_count=5"

# Destroy specific region (example)
terraform destroy -target="aws_instance.us_west_2_x86"

# Destroy all resources
terraform destroy
```

## Security Notes

- Instances use default security groups (modify as needed)
- No key pairs specified (add as required)
- Consider adding VPC configuration for production use

## Monitoring

Monitor your instances using:
- AWS CloudWatch for metrics
- AWS Cost Explorer for cost tracking
- Regional dashboards for performance

## Support

For issues or questions:
- Check Terraform documentation
- Review AWS EC2 documentation
- Verify IAM permissions for multi-region access
