variable public_key_path {
  description = "~/.ssh/appuser.pub"
}
  variable db_disk_image {
  description = "fd8hou2fde0pkrnsgdnk"
  default = "reddit-db-base"
}
variable subnet_id {
description = "e9b40gv495c0a3iu9318"
}
variable "private_key_path" {
  description = "The path to the private SSH key to use for connecting to the instance."
  type        = string
  default     = "~/.ssh/appuser"
}
