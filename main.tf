############ Providers ############

provider "aws" {
  secret_key = var.secret_key 
  access_key = var.access_key
  region = var.region
}

provider "kubernetes" {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "Terraform-eks-lb-qoq-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
}


















############ Instances ############

# resource "aws_instance" "master" {

# ami = var.ami
# instance_type = var.instance_master
# key_name = var.key_name
# vpc_security_group_ids = [aws_security_group.cluster_sg.id]

#   provisioner "local-exec" {
#     command = "open http://${self.public_dns}"
#   }

#   tags = {
#     Name = "terra_master_instance"
#   }
# }




############ initiate Instance(s) with count ############

# resource "aws_instance" "node" {
# ami = var.ami
# instance_type = var.instance_node
# key_name = var.key_name
# count = var.number_of_instances
# vpc_security_group_ids = [aws_security_group.cluster_sg.id]

#   provisioner "remote-exec" {
#     inline = [
#       #!/bin/bash
#       "uname -a",
#     ]
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file(var.key)
#       host        = self.public_ip
#     }
#   }

#   tags = {
#     Name = "terra_node_instance"
#   }
# }
