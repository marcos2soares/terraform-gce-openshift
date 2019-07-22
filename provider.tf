// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("./credenciais.json>")}"
 project     = "${var.project}"
 region      = "${var.region}"
 zone        = "${var.zone}"
}
