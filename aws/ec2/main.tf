provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "worker" {
  for_each      = var.worker_nodes
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = each.value
  }
}
