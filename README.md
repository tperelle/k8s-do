# Kubernetes on Digitalocean

This project is created following the [Digitalocean tutorials](https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-ubuntu-18-04).

## Infrastructure

### Configuration

Look at the configuration variables in the file `./terraform/variables.tf`. 

Create a new file `./terraform/terraform.tfvars` with the variable you want to supercharge:

- **PROJECT_PREFIX**: prefix of your project
- **SSH_KEY_FINGERPRINT**: figerprint of the SSH key you registered on Digitalocean
- **VM_NUMBER_MASTERS**: the number of master nodes
- **VM_NUMBER_WORKERS**: the number of worker nodes
- **VM_IMAGE**: the droplet image (the project actually support only Ubuntu images)
- **VM_SIZE**: the size of droplets (2 CPU and 2 Gb or RAM minimum recommended)
- **VM_TAGS**: tags for droplets

The project creates by default 3 Ubuntu 18.04 VMs on Digitalocean for a minimalist kubernetes cluster: 1 master and 2 nodes.

### Provision

To create the infrastructure:

```bash
cd ./terraform
terraform apply
```

The Terraform project generates the Ansible inventory `./ansible/hosts` based on VMs it provisioned.

## Install the kubernetes cluster

When all the VMs are provisioned by Terraform, then you can install the cluster by running the Ansible playbooks:

```bash
cd ./ansible
ansible-playbook initial.yml
ansible-playbook kube-dependencies.yml
ansible-playbook master.yml
ansible-playbook workers.yml
```

You can look at the inventory to get master node IP:

```bash
cat ./ansible/hosts
```

Then you can SSH to a master node with the `ubuntu` user and test a `kubectl` command:

```bash
$ ssh ubuntu@<master_IP>
$ kubectl get nodes
NAME              STATUS   ROLES    AGE     VERSION
tpe-k8s-master1   Ready    master   14m     v1.14.0
tpe-k8s-worker1   Ready    <none>   2m40s   v1.14.0
tpe-k8s-worker2   Ready    <none>   2m29s   v1.14.0
```
