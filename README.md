# Learning Terragrunt

Dự án này là một ví dụ đơn giản để học cách sử dụng Terragrunt với AWS, tạo và quản lý EC2 instances.

## Cấu trúc dự án

```
terragrunt.hcl             (Tệp cấu hình Terragrunt cấp cao nhất)
aws/
    ec2/                   (Module cho việc tạo EC2 instances)
        main.tf            (Mã Terraform chính cho EC2)
        output.tf          (Định nghĩa các outputs)
        terragrunt.hcl     (Cấu hình Terragrunt cho module EC2)
        variables.tf       (Định nghĩa các biến cho module EC2)
```

## Mô tả các tệp

### terragrunt.hcl (cấp cao nhất)

Tệp này hiện đang trống nhưng có thể được cấu hình để chứa:
- Remote state configuration
- Provider configuration chung
- Các inputs chung cho toàn bộ dự án

### aws/ec2/terragrunt.hcl

Định nghĩa:
- Nguồn module Terraform
- Các giá trị đầu vào như region, AMI ID, instance type
- Danh sách worker nodes cần tạo

### aws/ec2/main.tf

Chứa mã Terraform để:
- Cấu hình provider AWS
- Tạo EC2 instances sử dụng vòng lặp for_each
- Gắn tag cho mỗi instance

### aws/ec2/variables.tf

Định nghĩa các biến sử dụng trong module:
- aws_region: Khu vực AWS (ap-southeast-1)
- ami_id: ID của AMI (Ubuntu 22.04)
- instance_type: Loại EC2 instance (t2.micro)
- worker_nodes: Map của các worker nodes cần tạo

### aws/ec2/output.tf

Xuất thông tin về các tài nguyên đã tạo (hiện đang trống)

## Tùy chỉnh

### Thay đổi loại instance

Để thay đổi loại instance, chỉnh sửa giá trị `instance_type` trong `aws/ec2/terragrunt.hcl`:

```hcl
inputs = {
  # ... các giá trị khác
  instance_type = "t3.micro"  # Thay t2.micro bằng loại instance mong muốn
}
```

### Thay đổi AMI

Để sử dụng AMI khác, cập nhật `ami_id` trong `aws/ec2/terragrunt.hcl`:

```hcl
inputs = {
  # ... các giá trị khác
  ami_id = "ami-xxxxxxxxxxxxxxxxx"  # Thay bằng AMI ID mới
}
```

### Thêm hoặc xóa worker nodes

Chỉnh sửa map `worker_nodes` trong `aws/ec2/terragrunt.hcl`:

```hcl
inputs = {
  # ... các giá trị khác
  worker_nodes = {
    worker-1 = "Worker Node 1"
    worker-2 = "Worker Node 2"
    worker-3 = "Worker Node 3"  # Thêm worker mới
  }
}
```

## Các thực hành tốt nhất

1. **Remote State**: Cấu hình remote state với S3 và DynamoDB để làm việc nhóm
2. **Các biến môi trường**: Tạo cấu trúc thư mục cho các môi trường khác nhau (dev, staging, prod)
3. **Kế thừa**: Tận dụng tính năng kế thừa của Terragrunt để tránh lặp mã
4. **Version Pinning**: Chỉ định phiên bản cụ thể cho providers và modules

