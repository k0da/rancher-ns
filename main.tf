
data "rancher2_cluster" "cluster" {
  name = "${var.cluster_name}"
}
resource "rancher2_project" "jfrog" {
    cluster_id = "${data.rancher2_cluster.cluster.id}"
    name = "JFrog"
}
resource "rancher2_namespace" "jfog" {
    name = "artifactory-ha"
    project_id = "${rancher2_project.jfrog.id}"
}
resource "rancher2_namespace" "xray" {
    name = "xray-ha"
    project_id = "${rancher2_project.jfrog.id}"
}

