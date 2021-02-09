resource "lxd_container" "control_planes" {
  count = var.number_of_control_planes
  name  = "${var.control_plane_name}-${count.index + 1}"

  type      = var.type
  image     = var.image
  profiles  = var.profiles
  ephemeral = false

  limits = {
    cpu    = var.control_plane_cpu_limit
    memory = var.control_plane_mem_limit
  }
}
