# output "public_ip" {
#   value       = aws_instance.master.public_ip
#   sensitive   = false
#   description = "Instance public IP"
#   depends_on  = []
# }

# output "public_dns" {
#   value       = aws_instance.master.public_dns
#   sensitive   = false
#   description = "Instance public DNS"
#   depends_on  = []
# }

output "region" {
  description = "AWS Region"
  value       = var.region
}

output "cluster_name" {
  description = "K8S Cluster Name"
  value       = local.cluster_name
}