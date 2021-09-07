output "instance_ids" {
  description = "IDs of EC2 instances"
  value = [aws_instance.ec2_1.id, aws_instance.ec2_2.id]
}