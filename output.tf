#This file will countain all the outputs

output "slaves_ips" {
  value       = aws_instance.K8S_Cluster_instance_slave.*.private_ip
  description = "The ARNs for all users"
}

output "master_ips" {
  value       = aws_instance.K8S_Cluster_instance_master.*.private_ip
  description = "The ARNs for all users"
}
