output "test-instance-ip" {
  value = aws_instance.k3s.public_ip
}

output "install_script_location" {
  value = "/var/lib/cloud/instance/scripts/install_k3s.sh"
}

output "node_joining_token" {
  value = "/var/lib/rancher/k3s/server/node-token"
}


output "kubeconfig_file_for_remote_access" {
  value = "/tmp/kube_config.yaml"
}

