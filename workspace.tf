# Configure the Google Cloud provider
provider "google" {
  credentials = "${file("gc_credentials.json")}"
  project     = ""
  region      = ""
  account_file = "${file("gc_credentials.json")}"
}

resource "google_compute_instance" "workspace" {
  name = "workspace"
  machine_type = "n1-standard-1"
  zone = "europe-west1-b"

  disk {
    image = "ubuntu-1510-wily-v20151114"
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

