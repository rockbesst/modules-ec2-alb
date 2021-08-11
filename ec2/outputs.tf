output "ec2_id" {
    value = aws_instance.ec2[count.index].id
}