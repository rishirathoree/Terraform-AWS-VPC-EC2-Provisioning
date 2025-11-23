module "jenkis-setup" {
    source = "../../module"
    environment = var.environment
    vpc_cidr_block = var.vpc_cidr_block
    subnet_cidr_block = var.subnet_cidr_block
    public_subnet_count = var.public_subnet_count
    ami = var.ami
    key_pair = var.key_pair
    instance_type = var.instance_type
}