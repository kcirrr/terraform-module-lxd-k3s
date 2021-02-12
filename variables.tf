variable "cluster_name" {
  description = "Cluster name"
  default     = "cluster.local"
}

variable "number_of_control_planes" {
  description = "Number of control plane nodes."
  default     = 1
}

variable "number_of_workers" {
  description = "Number of worker nodes."
  default     = 1
}

variable "profiles" {
  description = "LXD profiles"
  type        = list(string)
  default     = ["default"]
}

variable "image" {
  description = "LXD image"
  default     = "images:ubuntu/focal/cloud"
}

variable "type" {
  description = "Type of LXD machine. Possible values are container or virtual-machine"
  default     = "virtual-machine"
}

variable "worker_disk_size" {
  description = "Worker disk size"
  default     = "20GB"
}

variable "worker_disk_pool" {
  description = "Worker disk pool"
  default     = "ssd"
}

variable "control_plane_disk_size" {
  description = "Control plane disk size"
  default     = "20GB"
}

variable "control_plane_disk_pool" {
  description = "Control plane disk pool"
  default     = "ssd"
}

variable "managed_fields" {
  type    = list(string)
  default = ["label", "taint"]
}

variable "flags" {
  type = list(string)
  default = [
    "--tls-san cluster.local",
    "--disable servicelb",
    "--disable traefik",
    "--disable local-storage"
  ]
}

variable "k3s_version" {
  description = "K3s version"
  default     = "latest"
}

variable "drain_timeout" {
  description = "Drain timeout"
  default     = "30s"
}

variable "cidr_pods" {
  description = "CIDR pods"
  default     = "10.42.0.0/16"
}

variable "cidr_services" {
  description = "CIDR pods"
  default     = "10.43.0.0/16"
}

variable "control_plane_name" {
  description = "Name of the control plane nodes"
  default     = "control-plane"
}

variable "worker_name" {
  description = "Name of the worker nodes"
  default     = "worker"
}

variable "control_plane_cpu_limit" {
  description = "CPU limit"
  default     = "4"
}

variable "control_plane_mem_limit" {
  description = "Memory limit"
  default     = "12GB"
}

variable "worker_cpu_limit" {
  description = "CPU limit"
  default     = "4"
}

variable "worker_mem_limit" {
  description = "Memory limit"
  default     = "12GB"
}

variable "user" {
  description = "User"
  default     = "root"
}

variable "bastion_host" {
  description = "Bastion host"
  default     = ""
}

variable "bastion_user" {
  description = "Bastion user"
  default     = ""
}
