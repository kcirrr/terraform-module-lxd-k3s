#  Terraform module LXD K3s

Terraform module for creating LXD nodes and installing K3s.

## Example
```
module "terraform-module-lxd-k3s" {
  source                   = "git@github.com:kcirrr/terraform-module-lxd-k3s.git"
  cluster_name             = "k8s.example.com"
  profiles                 = ["default", "vm"]
  bastion_user             = "username"
  bastion_host             = "ipaddress"
  number_of_control_planes = 1
  number_of_workers        = 3
  control_plane_cpu_limit  = "4"
  control_plane_mem_limit  = "8GB"

  flags = [
    "--tls-san k8s.example.com",
    "--disable servicelb",
    "--disable traefik",
    "--disable local-storage"
  ]
}
```
