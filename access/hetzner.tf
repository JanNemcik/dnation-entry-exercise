terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.32.2"
    }
  }
}

variable "hcloud_token" {
  sensitive = true
  type        = string
  description = "Hetzner API token"
  default     = ""
}

provider "hcloud" {
  token = var.hcloud_token
}

data "hcloud_network" "network" {
  name = "network"
}

data "hcloud_ssh_keys" "all_keys" {
}

resource "hcloud_server" "master" {
  # ...
  name        = "master-server"
  server_type = "cx21"
  image       = "ubuntu-20.04"
  location    = "hel1"
  ssh_keys = data.hcloud_ssh_keys.all_keys.ssh_keys.*.name
  labels = { type="master",project="exercise"}

  network {
    network_id = data.hcloud_network.network.id
  }
}

resource "hcloud_server" "worker-1" {
  # ...
  name        = "worker-server-1"
  server_type = "cx21"
  image       = "ubuntu-20.04"
  location    = "hel1"
  ssh_keys = data.hcloud_ssh_keys.all_keys.ssh_keys.*.name
  labels = { type="worker",project="exercise"}

  network {
    network_id = data.hcloud_network.network.id
  }
}

resource "hcloud_server" "worker-2" {
  # ...
  name        = "worker-server-2"
  server_type = "cx21"
  image       = "ubuntu-20.04"
  location    = "nbg1"
  ssh_keys = data.hcloud_ssh_keys.all_keys.ssh_keys.*.name
  labels = { type="worker",project="exercise"}

  network {
    network_id = data.hcloud_network.network.id
  }
}