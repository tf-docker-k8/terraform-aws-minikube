module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region    = data.aws_region.current.name
  cluster_name  = var.project_name
  aws_instance_type = "t3.medium"
  # we upload public key to EC2 instances
  ssh_public_key = var.key_location
  aws_subnet_id = local.public_subnet_ids[0] #ap-south-1a public subnet
  hosted_zone = var.hosted_zone
  hosted_zone_private = false

  tags = {
    Application = var.project_name
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}