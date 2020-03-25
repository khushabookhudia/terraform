provider "google" {
  credentials = "${file("${var.path}/secret.json")}"

}
