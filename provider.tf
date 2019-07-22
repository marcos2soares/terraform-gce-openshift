// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("<your_service_account.json>")}"
 project     = "@PROJETO@"
 region      = "@REGIAO@"
 zone        = "@ZONA@"
}
