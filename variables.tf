variable "project" {
    type = map
    default = {
        test = {
            ec2_count = 2,
            subnet_count = 2,
            environment = "test"
        }
    }
}