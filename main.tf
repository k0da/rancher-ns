
data "rancher2_cluster" "cluster" {
  name = "${var.cluster_name}"
}
resource "rancher2_project" "project" {
    cluster_id = "${data.rancher2_cluster.cluster.id}"
    name = "${var.prj_name}"
}
resource "rancher2_namespace" "namespace" {
    for_each = toset("${var.namespaces}")
    name = each.value
    project_id = "${rancher2_project.project.id}"
}

resource "rancher2_project_logging" "logging" {
    name = "elasticsearch"
    project_id = "${rancher2_project.project.id}"
    kind = "custom"
    custom_target_config {
      content = templatefile("./logging.tmpl", 
                              { endpoint = "${var.elastic_endpoint}", 
                                pass = "${var.elastic_password}"
                              })
    }
}
