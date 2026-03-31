output "instance_public_ip" {
  description = "Public IP of the K3s server"
  value       = aws_instance.k3s.public_ip
}

output "instance_private_ip" {
  description = "Private IP of the K3s server"
  value       = aws_instance.k3s.private_ip
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.k3s.id
}

output "ssh_username" {
  description = "SSH username to connect to the instance"
  value       = "ec2-user"
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i ~/.ssh/james-enbuild-dev.pem ec2-user@${aws_instance.k3s.public_ip}"
}

output "ami_id" {
  description = "AMI ID used for the instance"
  value       = aws_instance.k3s.ami
}

output "vpc_id" {
  description = "VPC ID where instance is launched"
  value       = data.aws_vpc.default.id
}

output "subnet_id" {
  description = "Subnet ID where instance is launched"
  value       = aws_instance.k3s.subnet_id
}

output "security_group_id" {
  description = "Security Group ID attached to the instance"
  value       = var.security_group_id
}

output "install_script_location" {
  description = "Location of install script on the instance"
  value       = "/var/lib/cloud/instance/scripts/install_k3s.sh"
}

output "node_joining_token" {
  description = "Path to the node joining token (available after K3s is installed)"
  value       = "/var/lib/rancher/k3s/server/node-token"
}

output "kubeconfig_file" {
  description = "Path to kubeconfig file for remote access (available after K3s is installed)"
  value       = "/etc/rancher/k3s/k3s.yaml"
}

output "k3s_server_url" {
  description = "K3s server URL for joining additional nodes"
  value       = "https://${aws_instance.k3s.public_ip}:6443"
}
