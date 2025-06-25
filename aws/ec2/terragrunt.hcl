terraform {
  source = "../../../learning-terragrunt/aws/ec2"
}

inputs = {
  aws_region    = "ap-southeast-1"
  ami_id        = "ami-0198a868663199764" # Thay bằng AMI phù hợp
  instance_type = "t3.micro"
  worker_nodes = {
    worker-1 = "Worker Node 1"
    worker-2 = "Worker Node 2"
  }
}