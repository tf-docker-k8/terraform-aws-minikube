locals {
  vpc_id = module.this.vpc_id
  db_subnet_group_name = module.this.db_subnet_group_name
  public_subnet_ids = module.this.public_subnet_ids
}

output "vpc_id" {
  value = local.vpc_id
}