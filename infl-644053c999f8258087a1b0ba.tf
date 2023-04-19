resource "google_cloudfunctions_function" "function-01-tag-check-ade" {
  docker_registry              = "CONTAINER_REGISTRY"
  entry_point                  = "helloWorld"
  https_trigger_security_level = "SECURE_ALWAYS"
  https_trigger_url            = "https://us-central1-norton-sandbox.cloudfunctions.net/function-01-tag-check"
  labels = {
    deployment-tool = "console-cloud"
  }
  max_instances         = 3000
  name                  = "function-01-tag-check"
  project               = "norton-sandbox"
  region                = "us-central1"
  runtime               = "nodejs18"
  service_account_email = "norton-sandbox@appspot.gserviceaccount.com"
  trigger_http          = true
}




resource "google_cloudfunctions_function" "function-1-tag-check-dd2" {
  docker_registry              = "CONTAINER_REGISTRY"
  entry_point                  = "helloWorld"
  https_trigger_security_level = "SECURE_ALWAYS"
  https_trigger_url            = "https://us-central1-norton-sandbox.cloudfunctions.net/function-1-tag-check"
  labels = {
    deployment-tool = "console-cloud"
  }
  max_instances         = 3000
  name                  = "function-1-tag-check"
  project               = "norton-sandbox"
  region                = "us-central1"
  runtime               = "nodejs18"
  service_account_email = "norton-sandbox@appspot.gserviceaccount.com"
  trigger_http          = true
}




resource "google_compute_instance" "instance-1-9a3" {
  boot_disk {
    device_name = "instance-1"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-11-bullseye-v20230306"
      size  = 10
      type  = "pd-balanced"
    }
    source = "https://www.googleapis.com/compute/v1/projects/norton-sandbox/zones/us-central1-a/disks/instance-1"
  }
  confidential_instance_config {
    enable_confidential_compute = false
  }
  enable_display = false
  machine_type   = "e2-micro"
  name           = "instance-1"
  network_interface {
    access_config {
      nat_ip       = "34.30.82.162"
      network_tier = "PREMIUM"
    }
    network            = "https://www.googleapis.com/compute/v1/projects/norton-sandbox/global/networks/default"
    network_ip         = "10.128.0.2"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/norton-sandbox/regions/us-central1/subnetworks/default"
    subnetwork_project = "norton-sandbox"
  }
  project = "norton-sandbox"
  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  scheduling {
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }
  service_account {
    email  = "79009598330-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  zone = "us-central1-a"
}




resource "google_bigquery_table" "dummy-5d5" {
  dataset_id = "onboarding_dataset"
  project    = "norton-sandbox"
  schema     = "null"
  table_id   = "dummy"
}




resource "google_bigquery_dataset" "onboarding_dataset-383" {
  access {
    role          = "OWNER"
    user_by_email = "john.norton@corestack.io"
  }
  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }
  access {
    role          = "READER"
    special_group = "projectReaders"
  }
  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }
  dataset_id = "onboarding_dataset"
  project    = "norton-sandbox"
}




resource "google_compute_network" "nortonnetwork-051" {
  enable_ula_internal_ipv6 = false
  mtu                      = 1460
  name                     = "nortonnetwork"
  project                  = "norton-sandbox"
  routing_mode             = "REGIONAL"
}




resource "google_compute_firewall" "default-allow-rdp-b7e" {
  allow {
    ports    = ["3389"]
    protocol = "tcp"
  }
  description   = "Allow RDP from anywhere"
  direction     = "INGRESS"
  disabled      = false
  name          = "default-allow-rdp"
  network       = "https://www.googleapis.com/compute/v1/projects/norton-sandbox/global/networks/default"
  priority      = 65534
  project       = "norton-sandbox"
  source_ranges = ["0.0.0.0/0"]
}




resource "google_service_account" "projectsnorton-sandboxserviceAccountsterraform-usernorton-sandboxiamgserviceaccountcom-5f5" {
  account_id   = "terraform-user"
  display_name = "terraform-user"
  project      = "norton-sandbox"
}




resource "google_service_account" "projectsnorton-sandboxserviceAccountscorestack-service-bstnorton-sandboxiamgserviceaccountcom-68f" {
  account_id   = "corestack-service-bst"
  description  = "For CoreStack Access"
  display_name = "corestack-service-bst"
  project      = "norton-sandbox"
}




resource "google_service_account" "projectsnorton-sandboxserviceAccountsnorton-service-acct-4-csnorton-sandboxiamgserviceaccountcom-42a" {
  account_id   = "norton-service-acct-4-cs"
  display_name = "norton-service-acct-4-cs"
  project      = "norton-sandbox"
}

