module "network" {
  source = "../../modules/vpc-network"
  azs    = ["ap-south-1a", "ap-south-1b"]
}

module "frontend" {
  source                      = "../../modules/frontend"
  project_name                = var.project_name
  environment                 = var.environment
  cloudfront_distribution_arn = module.cloudfront.cloudfront_distribution_arn
}

module "backend" {
  source                 = "../../modules/app"
  project_name           = var.project_name
  environment            = var.environment
  vpc_id                 = module.network.vpc_id
  instance_type          = "t3.micro"
  db_cluster_resource_id = module.database.cluster_resource_id
  app_subnet_ids         = module.network.app_subnet_ids
  public_subnet_ids      = module.network.public_subnet_ids
  db_user                = "dbadmin"
  alb_certificate_arn    = var.alb_certificate_arn
}

module "database" {
  source              = "../../modules/database"
  project_name        = var.project_name
  environment         = var.environment
  vpc_id              = module.network.vpc_id
  db_subnet_ids       = module.network.db_subnet_ids
  app_sg_id           = module.backend.security_group_id
  skip_final_snapshot = true
}

module "storage" {
  source                      = "../../modules/storage"
  project_name                = var.project_name
  environment                 = var.environment
  cloudfront_distribution_arn = module.cloudfront.cloudfront_distribution_arn
}

module "cloudfront" {
  source                               = "../../modules/cloudfront"
  project_name                         = var.project_name
  environment                          = var.environment
  backend_alb_domain_name              = module.backend.alb_dns_name
  domain_name                          = var.domain_name
  cloudfront_certificate_arn           = var.cloudfront_certificate_arn
  frontend_bucket_regional_domain_name = module.frontend.s3_bucket_regional_domain_name
  storage_bucket_regional_domain_name  = module.storage.s3_bucket_regional_domain_name
}
