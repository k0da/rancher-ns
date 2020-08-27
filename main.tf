
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
