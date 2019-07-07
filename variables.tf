variable "project" {
  default = "<your_project_id>"
}

variable "region" {
  default = "southamerica-east1"
}

variable "zone" {
  default = "southamerica-east1-b"
}

variable "clusterid" {
  default = "<your_cluster_id>"
}

// Used to log on google cloud console
variable "google_user" {
  default = "<your_google_user_account>"
}

variable "private_range" {
 default = "10.240.0.0/24"
}

variable "public_range" {
 default = "0.0.0.0/0"
}

variable "managed-zone-name" {
 default = "<your-managerd-domain>"
}

variable "domain" {
 default = "<your_domain>."
}

variable "bastion_instance_size" {
  default = "g1-small"
}

variable "bastion_disk_size" {
  default = "10"
}

variable "bastion_disk_type" {
  default = "pd-ssd"
}

variable "master_instance_size" {
  default = "n1-standard-4"
}

variable "infra_instance_size" {
  default = "n1-standard-4"
}

variable "app_instance_size" {
  default = "n1-standard-2"
}

variable "number" {
 default = 3
}

variable "gfs_disk_size" {
  default = "100"
}

variable "gfs_disk_type" {
  default = "pd-standard"
}

variable "boot_disk_size" {
  default = "30"
}

variable "docker_disk_size" {
  default = "50"
}

variable "boot_disk_type" {
  default = "pd-ssd"
}

variable "docker_disk_type" {
  default = "pd-ssd"
}

variable "image_family" {
  default = "rhel"
}

variable "private_ssh_key"{
  default     = "~/.ssh/<your_ssh_key>"
}

variable "public_ssh_key" {
  default = "~/.ssh/<your_ssh_key>.pub"
}

variable "rhn_username"{
  default = ""
}

variable "rhn_password"{
  default = ""
}

variable "pool_id"{
   default = ""
}
