# Terraform Infrastructure for mock

data "azurerm_client_config" "current" {}

module "rg" {
  source      = "../../Modules/resource_group"
  project     = var.project
  environment = var.environment
  location    = var.rg_location
  tags        = var.tags
}

module "key_vault" {
  source              = "../../Modules/key_vault"
  project             = var.project
  environment         = var.environment
  location            = var.rg_location
  resource_group_name = module.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags                = var.tags
}

module "app_service_plan" {
  source              = "../../Modules/app_service_plan"
  project             = var.project
  environment         = var.environment
  location            = var.rg_location
  resource_group_name = module.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
  tags                = var.tags
}

module "app_service" {
  source              = "../../Modules/app_service"
  project             = var.project
  environment         = var.environment
  location            = var.rg_location
  resource_group_name = module.rg.name
  service_plan_id     = module.app_service_plan.id
  tags                = var.tags
}
