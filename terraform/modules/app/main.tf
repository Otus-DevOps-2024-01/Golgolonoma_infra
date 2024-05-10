# terraform {
#   required_providers {
#     yandex = {
#       source  = "yandex-cloud/yandex"
#       version = "0.112.0"
#     }
#   }
# }

resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  # Добавление провиженера для установки Python
  provisioner "remote-exec" {
    # Использование подключения по SSH
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.network_interface[0].nat_ip_address
      private_key = file(var.private_key_path)
      agent       = false
    }

    # Скрипт для установки Python 3.6
inline = [
    "sleep 40",
  "sudo add-apt-repository -y ppa:jblgf0/python && sudo apt-get update && sudo apt-get install -y python3.6",
  "sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2",
]
  }
}
