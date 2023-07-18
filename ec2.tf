# this EC2 is for Docker workstation
resource "aws_key_pair" "kubernetes" {
  key_name   = var.key_name
  public_key = file(var.key_location)
}

resource "aws_security_group" "allow_tls" {
  name        = "allow-tls"
  description = "Allow all ports"
  vpc_id      = local.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "workstation" {
    #this is fetching AWS Linux 2 AMI ID dynamically
    ami = data.aws_ami.ami_id.id
    # from instance_type map instance will be selected based on the current workspace
    instance_type = "t3.medium"
    root_block_device  {
      volume_size = 20
    }
    key_name = aws_key_pair.kubernetes.key_name
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    user_data = "${file("scripts/docker.sh")}"
    subnet_id = local.public_subnet_ids[0]
    associate_public_ip_address = true
    tags = {
        Name = "workstation"
    }
}