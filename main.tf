    module "networking" {
        source = "./modules/networking"
        environment = var.environment
        aws_region = var.aws_region
    }

    module "security"{
        source = "./modules/security"
        vpc_id = module.networking.vpc_id
        environment = var.environment
    }

    module "compute" {
        source = "./modules/compute"
        subnet_id = module.networking.public_subnet_1
        security_group = module.security.web_sg_id
        environment = var.environment
        public_subnets = [module.networking.public_subnet_1, module.networking.public_subnet_2]
    }


    module "database" {
        source = "./modules/database"
        db_subnet_group_name = module.networking.db_subnet_group_name
        db_security_group_id = module.security.db_sg_id
        environment          = var.environment
        db_password          = var.db_password
        engine_name          = var.engine_name
        engine_version       = var.engine_version
        instance_type        = var.instance_type
        database_name        = var.database_name
        username             = var.username
        
    }
