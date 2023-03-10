module "my-network-1" {
  source = "./Modules/NetworkInfra"
  vpc_cidr_block = "10.0.0.0/16"
  vpc_name = "vpc"
  AZ1_subnet_cidr_block = ["10.0.0.0/24","10.0.1.0/24"]
  AZ1_subnet_name = ["publicSub1","privateSub1"]
  AZ2_subnet_cidr_block = ["10.0.2.0/24","10.0.3.0/24"]
  AZ2_subnet_name = ["publicSub2","privateSub2"]
  availability_zones = ["us-east-1a","us-east-1b"]
  public_ip = ["true","false"]
  internet_gateway_name = "IGW"
  eip_name = "elastic_ip"
  Nat_gw = "Nat_gw"
  security_source = "0.0.0.0/0"
  RT_name = ["PublicRT","PrivateRT"]
}

module "my-security-1" {
  source = "./Modules/Security"
  sg_name = "SecGroup"
  sg_description = "Allow http and ssh inbound traffic and all outbound traffic"
  vpc_id = module.my-network-1.vpc_id
  security_rules = {
        internal = [80,22,0],
        external = [80,22,0],
        protocol = ["tcp","-1"]
  }
  security_source = "0.0.0.0/0"
  }

module "my-compute-1" {
  source = "./Modules/Compute"
  instance_type = "t3.micro" 
  subnet1_id = module.my-network-1.subnet1_id
  subnet2_id = module.my-network-1.subnet2_id
  subnet3_id = module.my-network-1.subnet3_id
  subnet4_id = module.my-network-1.subnet4_id
  sg_id = [module.my-security-1.sg_id]
  instance_name = ["public_instance1","private_instance1",
                   "public_instance2","private_instance2"]
  volume_name = ["public_instance1","private_instance1",
                 "public_instance2","private_instance2"]
  vpc_id = module.my-network-1.vpc_id
  key_pair = "ssh-public"
  
}