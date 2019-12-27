# Create Droplet masters
resource "digitalocean_droplet" "masters" {
  count    = "${var.VM_NUMBER_MASTERS}"
  name     = "${var.PROJECT_PREFIX}-master${count.index + 1}"
  image    = "${var.VM_IMAGE}"
  region   = "${var.DO_REGION}"
  size     = "${var.VM_SIZE}"
  ssh_keys = ["${var.SSH_KEY_FINGERPRINT}"]
  tags     = "${var.VM_TAGS}"
}

# Create Droplet workers
resource "digitalocean_droplet" "workers" {
  count    = "${var.VM_NUMBER_WORKERS}"
  name     = "${var.PROJECT_PREFIX}-worker${count.index + 1}"
  image    = "${var.VM_IMAGE}"
  region   = "${var.DO_REGION}"
  size     = "${var.VM_SIZE}"
  ssh_keys = ["${var.SSH_KEY_FINGERPRINT}"]
  tags     = "${var.VM_TAGS}"
}