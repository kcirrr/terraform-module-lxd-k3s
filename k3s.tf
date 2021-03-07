module "k3s" {
  source      = "xunleii/k3s/module"
  version     = "2.2.3"
  depends_on_ = lxd_container.workers

  k3s_version = var.k3s_version
  name        = var.cluster_name

  cidr = {
    pods     = var.cidr_pods
    services = var.cidr_services
  }
  drain_timeout  = var.drain_timeout
  managed_fields = var.managed_fields

  servers = {
    for i in range(length(lxd_container.control_planes)) :
    lxd_container.control_planes[i].name => {
      ip = lxd_container.control_planes[i].ipv4_address
      connection = {
        host = lxd_container.control_planes[i].ipv4_address
        user = var.user
        bastion_user : var.bastion_user != "" ? var.bastion_user : null
        bastion_host : var.bastion_host != "" ? var.bastion_host : null
      }
      flags  = var.flags
      taints = { "node.k3s.io/type" : var.number_of_workers != 0 ? "server:NoSchedule" : null }
    }
  }

  agents = {
    for i in range(length(lxd_container.workers)) :
    "${lxd_container.workers[i].name}_node" => {
      name = lxd_container.workers[i].name
      ip   = lxd_container.workers[i].ipv4_address
      connection = {
        host = lxd_container.workers[i].ipv4_address
        user = var.user
        bastion_user : var.bastion_user != "" ? var.bastion_user : null
        bastion_host : var.bastion_host != "" ? var.bastion_host : null
      }
    }
  }
}
