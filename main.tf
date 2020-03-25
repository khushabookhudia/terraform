resource "google_project" "demo-khushaboo" {
  name       = "demo-khushaboo"
  project_id = "flash-zenith-271010"
}

resource "google_compute_instance" "instance-1" {
    can_ip_forward       = false
    deletion_protection  = false
    enable_display       = false
    labels               = {}
    machine_type         = "n1-standard-1"
    metadata             = {}
    name                 = "instance-1"
    project              = "flash-zenith-271010"
    tags                 = [
        "http-server",
    ]
    zone                 = "asia-east1-b"

    boot_disk {
        auto_delete = true
        device_name = "instance-1"
        mode        = "READ_WRITE"
        source      = "https://www.googleapis.com/compute/v1/projects/flash-zenith-271010/zones/asia-east1-b/disks/instance-1"

        initialize_params {
            image  = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20200309"
            labels = {}
            size   = 10
            type   = "pd-standard"
        }
    }
    network_interface {

        network            = "https://www.googleapis.com/compute/v1/projects/flash-zenith-271010/global/networks/demo-vpc-terra"
        network_ip         = "10.0.1.2"
        subnetwork         = "https://www.googleapis.com/compute/v1/projects/flash-zenith-271010/regions/asia-east1/subnetworks/subnet-1"
        subnetwork_project = "flash-zenith-271010"

        access_config {
            nat_ip       = "35.201.156.25"
            network_tier = "PREMIUM"
        }

}
}

resource "google_compute_network" "demo-vpc-terra" {
  name = "demo-vpc-terra"
  auto_create_subnetworks = false
  project = "flash-zenith-271010"
  delete_default_routes_on_create = false
}
