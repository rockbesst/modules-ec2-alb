output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = { for p in sort(keys(var.project)) : p => ec2[p].instance_ids }
}