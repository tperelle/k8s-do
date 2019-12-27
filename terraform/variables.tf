###########################
# DO PARAMETERS
###########################

variable "DO_REGION" {
  default = "fra1"
}

###########################
# PROJECT PARAMETERS
###########################

variable "PROJECT_PREFIX" {
  default = "tpe-k8s"
}

# SSH key fingerprint
variable "SSH_KEY_FINGERPRINT" {
  default = "50:2c:69:60:20:80:4a:81:d8:d6:e4:26:56:f6:17:31"
}

# Number of masters
variable "VM_NUMBER_MASTERS" {
  default = 1
}

# Number of workers
variable "VM_NUMBER_WORKERS" {
  default = 2
}

# VM image
variable "VM_IMAGE" {
  default = "ubuntu-18-04-x64"
}

# VM type
variable "VM_SIZE" {
  default = "s-2vcpu-2gb"
}

# VM tags
variable "VM_TAGS" {
  default = ["tpe", "k8s"]
}