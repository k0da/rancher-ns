terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.10.0"
    }
  }
}

provider "rancher2" {
  api_url    = "${var.rancher_url}"
  token_key  = "${var.token_key}"
  insecure   = true
}


