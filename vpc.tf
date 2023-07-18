module "this" {
  #source = "../terraform-aws-vpc-1"
  source = "git::https://github.com/tf-docker-k8/terraform-aws-vpc.git"
  project_name = var.project_name
  vpc_cidr = var.vpc_cidr
  vpc_tags = var.common_tags
  igw_tags = var.common_tags

  public_subnet_cidr = var.public_subnet_cidr
  public_subnet_tags = var.common_tags
  public_route_table_tags = var.common_tags
  eip_tags = var.common_tags
  nat_gateway_tags = var.common_tags

  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_tags = var.common_tags
  private_route_table_tags = var.common_tags

  database_subnet_cidr = var.database_subnet_cidr
  database_subnet_tags = var.common_tags
  database_route_table_tags = var.common_tags

  db_subnet_group_tags = var.common_tags
  
}