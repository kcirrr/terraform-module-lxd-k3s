resource "lxd_container" "workers" {
  count = var.number_of_workers
  name  = "${var.worker_name}-${count.index + 1}"

  type      = var.type
  image     = var.image
  profiles  = var.profiles
  ephemeral = false

  device {
    name = "root"
    type = "disk"
    properties = {
      path = "/"
      pool = var.worker_disk_pool
      size = var.worker_disk_size
    }
  }

  limits = {
    cpu    = var.worker_cpu_limit
    memory = var.worker_mem_limit
  }
}
