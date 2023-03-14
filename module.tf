module "natgateway" {
  source              = "../Natgateway"
  resource_group_name = "network"
  tags = {
    "Terraform" = "1"
  }
  location     = "Central india"
  natGWIPName  = "public-ip"
  natGWName    = "natgateway"
  pip_prefix   = "pip-prefix"
  subnet-name  = "zp-oyo-k8s"
  vnet-name    = "zp-oyorooms"
  vnet-rg-name = "network"
}
