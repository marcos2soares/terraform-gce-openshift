variable "project" {
}

variable "region" {
}

variable "zone" {
}

variable "clusterid" {
}

variable "bastion_size" {
  default = "g1-small"
}

variable "bastion_disk_size" {
  default = "15"
}

variable "bastion_disk_type" {
  default = "pd-standard"
}

variable "base_image" {
  default = "debian-cloud/debian-9"
}

variable "subnetwork-name" {
}

variable "bastion_ssh_key_file" {
  default = "~/.ssh/tf-ssh-key"
}

variable "private_ssh_key"{
  default     = "~/.ssh/tf-ssh-key"
}
