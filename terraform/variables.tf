variable "cloud_id" {
  description = "b1gv5epv8s5utubjjdqj"
}
variable "folder_id" {
  description = "b1gjr95lpjjlsptbni8k"
}
variable "zone" {
  description = "ru-central1-a"
  default     = "ru-central1-a"
}
variable "public_key_path" {
  description = "~/.ssh/appuser.pub"
}
variable "image_id" {
  description = "fd8r45dbvtfd9g8nuf58"
}
variable "subnet_id" {
  description = "e9b40gv495c0a3iu9318"
}
variable "service_account_key_file" {
  description = "/home/nurnle/git/Golgolonoma_infra/key.json"
}
variable "private_key_path" {
  description = "~/.ssh/appuser"
}
variable app_disk_image {
  description = "fd8ct3b4vsmajhks07i7"
  default = "fd8ct3b4vsmajhks07i7"
}
variable db_disk_image {
description = "fd8hou2fde0pkrnsgdnk"
default = "fd8hou2fde0pkrnsgdnk"
}
