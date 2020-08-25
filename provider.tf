terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.10.0"
    }
  }
}

provider "rancher2" {
  api_url    = "https://rancher-270-prod.caas.absa.co.za/v3"
  token_key  = "${var.token_key}"
  insecure   = true
}


