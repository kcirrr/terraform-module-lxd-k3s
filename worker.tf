resource "lxd_container" "workers" {
  count = var.number_of_workers
  name  = "${var.worker_name}-${count.index + 1}"

  type      = var.type
  image     = var.image
  profiles  = var.profiles
  ephemeral = false

  limits = {
    cpu    = var.worker_cpu_limit
    memory = var.worker_mem_limit
  }
}
