variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0198a868663199764" // Ubuntu 22.04
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "worker_nodes" {
  description = "List worker nodes"
  type        = map(string)
  default = {
    worker-1 = "Worker Node 1"
    worker-2 = "Worker Node 2"
  }
}