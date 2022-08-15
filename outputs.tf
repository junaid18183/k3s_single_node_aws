output "test-instance-ip" {
  value = aws_instance.k3s.public_ip
}

output "install_script_location" {
  value = "/var/lib/cloud/instance/scripts/install_k3s.sh"
}