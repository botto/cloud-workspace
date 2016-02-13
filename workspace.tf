# Configure the Google Cloud provider
provider "google" {
  credentials = "${file("gc_credentials.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_network" "workspace" {
  name = "${var.workspace_name}"
  ipv4_range = "10.0.100.0/24"
}

resource "google_compute_firewall" "workspace-mosh" {
  name = "${var.workspace_name}-mosh"
  network = "${google_compute_network.workspace.name}"

  allow {
    protocol = "udp"
    ports = ["60000-61000"]
  }

  source_ranges = [
    "0.0.0.0/0"
  ]
}

resource "google_compute_firewall" "workspace-ssh" {
  name = "${var.workspace_name}-ssh"
  network = "${google_compute_network.workspace.name}"

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = [
    "0.0.0.0/0"
  ]
}

resource "google_compute_instance" "workspace" {
  name = "${var.workspace_name}"
  machine_type = "n1-standard-1"
  zone = "${var.region}"

  disk {
    image = "ubuntu-1510-wily-v20151114"
  }

  network_interface {
    network = "${google_compute_network.workspace.name}"
    access_config {
    }
  }
}
