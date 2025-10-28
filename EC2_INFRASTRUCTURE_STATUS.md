# EC2 Infrastructure Status Report
**Generated:** October 28, 2025 13:18 IST

## Current Running Instances

### US-East-1 (3 running)
- **Terraform Managed:**
  - `i-0183bc54ea1064d12` - t3.micro - x86-instance-east-1
  - `i-0577e80e6c176ba19` - t3.micro - x86-instance-east-2  
  - `i-0c078917d2d55d80e` - t3.micro - x86-instance-east-3

### US-West-2 (4 running)
- **Terraform Managed:**
  - `i-0321f2d368fbc6468` - t3.medium - x86-instance-west-1
  - `i-05b28d66adeaa818d` - t3.medium - x86-instance-west-2
- **Manual/Unmanaged:**
  - `i-03489e5450d7d9771` - t3.medium - demo-t3-medium-us-west-2
  - `i-004cd017afa7cad9c` - t3.medium - demo-t3-medium-us-west-2

### AP-South-1 (8 running)
- **Terraform Managed:**
  - `i-097c67e2e96ec986b` - t3.large - x86-instance-mumbai-1
  - `i-0b52eda550bcc6b49` - t3.large - x86-instance-mumbai-2
  - `i-01b7692d298422e10` - t3.large - x86-instance-mumbai-3
  - `i-056ba9880d1f2d370` - t3.large - x86-instance-mumbai-4
- **Manual/Unmanaged:**
  - `i-0c524c4a9d12f16e9` - t3.large - demo-t3-large-mumbai
  - `i-0b09b3a532997bb8e` - t3.large - demo-t3-large-mumbai
  - `i-05cc5b390353dc730` - t3.large - demo-t3-large-mumbai
  - `i-0611657386d6b5747` - t3.large - demo-t3-large-mumbai

## Summary
- **Total Running:** 15 instances
- **Terraform Managed:** 9 instances
- **Manual/Unmanaged:** 6 instances
- **Terminated (cleanup needed):** Multiple terminated instances visible in us-east-1

## Recommendations
1. **Terminate unmanaged instances** to reduce costs and maintain IaC compliance
2. **Import unmanaged instances** into Terraform if they should be managed
3. **Clean up terminated instances** from AWS console view
