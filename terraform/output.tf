data "template_file" "ansible" {
  template = "${file("./templates/hosts.tpl")}"

  vars = {
    connection_strings_masters = "${join("\n", formatlist("%s ansible_host=%s ansible_user=root", digitalocean_droplet.masters.*.name, digitalocean_droplet.masters.*.ipv4_address))}"
    connection_strings_workers = "${join("\n", formatlist("%s ansible_host=%s ansible_user=root", digitalocean_droplet.workers.*.name, digitalocean_droplet.workers.*.ipv4_address))}"
  }
}

resource "local_file" "ansible" {
  content  = "${data.template_file.ansible.rendered}"
  filename = "../ansible/hosts"
}