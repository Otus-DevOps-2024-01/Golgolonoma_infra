variable public_key_path {
  description = "~/.ssh/appuser.pub"
}
variable app_disk_image {
  description = "fd8ct3b4vsmajhks07i7"
  default = "reddit-app-base"
}
variable subnet_id {
description = "e9b40gv495c0a3iu9318"
}
variable "private_key_path" {
  description = "The path to the private SSH key to use for connecting to the instance."
  type        = string
  default     = "~/.ssh/appuser"
}
