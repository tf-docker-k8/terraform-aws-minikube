data "aws_ami" "ami_id" {

    most_recent      = true
    owners           = ["amazon"]

    filter {
        name   = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-*"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_region" "current" {}