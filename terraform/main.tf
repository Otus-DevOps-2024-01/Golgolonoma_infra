# terraform {
#   required_providers {
#     yandex = {
#       source  = "yandex-cloud/yandex"
#       version = "0.112.0"
#     }
#   }
# }

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

terraform {
    backend "s3" {
    endpoint = "https://storage.yandexcloud.net"
    bucket = "otus-maxim"
    region = "ru-central1-a"
    key    = "/home/nurnle/git/Golgolonoma_infra/key.json"
    access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
    secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key


    skip_region_validation      = true
    skip_credentials_validation = true
    # skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    # skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  }
}

module "app" {
  source          = "./modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
  providers = {
    yandex = yandex
  }
}

module "db" {
  source          = "./modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
  providers = {
    yandex = yandex
  }
}
