output "ec2_id" {
    value = aws_instance.ec2[count.index].id
}

output "ec2_index" {
    value = count.index
}