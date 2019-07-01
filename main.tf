// Prepare raw disk to create custom ami
resource "null_resource" "create_raw_disk" {
  provisioner "local-exec" {
    command = "wget http://repo.necol.org/iso/rhel-server-7.5-x86_64-kvm.qcow2; sudo apt install qemu-utils -y; qemu-img convert -p -S 4096 -f qcow2 -O raw rhel-server-7.5-x86_64-kvm.qcow2 disk.raw; tar -Szcf rhel-7.5.tar.gz disk.raw"
 }
}

resource "google_storage_bucket" "temp-image-store" {
  name = "${var.clusterid}-rhel-image-temp"
  storage_class = "REGIONAL"
  location = "${var.region}"
  labels = {
    ocp-cluster = "${var.clusterid}"
 }
}

resource "google_storage_bucket_object" "rhel-temp-image" {
  name = "rhel-7.5.tar.gz"
  source = "./rhel-7.5.tar.gz"
  bucket = "${google_storage_bucket.temp-image-store.name}"
  depends_on = ["google_storage_bucket.temp-image-store"]
}

// Add metadata to all project
resource "google_compute_project_metadata_item" "ssh-key" {
  key = "sshKey"
  value = "jeniffer_jc29:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+/2pELvk0l8wtGbznHFXy/v8ifyGg4eT7cx3D3dcFzPGyLQpZkPI44IfPYTBgjcl1NBtKNmWb9VDkKCsaJ6P/KEv1BqWmuGJplYyVKmS829z25/mbWoc7w1shqm59MZTgwyNEU9Q/f7x6/J8F4GR8zmqi8unuuyZ3MI+btHAgotK/WTvoP/qGUe4Wz+x3ofvyVCrX024ND4NZAq9KeTSmZo6rtbTkiDZ6yQgRrzdrIXt+ogmUzmuAQF8KIWNJOEoqNu0jJr6Qja3EjdoHLMv3U9j5YDrIMiImR3JBRs+dgj6sPsKEZlYhbRx57lBuLpAGDARo1iH1DCn+SBK6DQCb jeniffer_jc29"
  project = "${var.project}"
}

// This module deploy Network and Subnetwork
module "network" {
  source  = "./modules/network"
  project = "${var.project}"
}

// Module to deploy bastion node
module "bastion_node" {
  source = "./modules/nodes/bastion_node"
  project = "${var.project}"
  zone = "${var.zone}"
  region = "${var.region}"
  clusterid = "${var.clusterid}"
  subnetwork-name = "${module.network.subnetwork-name}"
}

// Module to deploy master node
module "master_node" {
  source = "./modules/nodes/master_node"
  project = "${var.project}"
  zone = "${var.zone}"
  region = "${var.region}"
  clusterid = "${var.clusterid}"
  subnetwork-name = "${module.network.subnetwork-name}"
}

// Module to deploy infra node
module "infra_node" {
  source = "./modules/nodes/infra_node"
  project = "${var.project}"
  zone = "${var.zone}"
  region = "${var.region}"
  clusterid = "${var.clusterid}"
  subnetwork-name = "${module.network.subnetwork-name}"
}

// Module to deploy apps node
module "app_node" {
  source = "./modules/nodes/app_node"
  project = "${var.project}"
  zone = "${var.zone}"
  region = "${var.region}"
  clusterid = "${var.clusterid}"
  subnetwork-name = "${module.network.subnetwork-name}"
}
