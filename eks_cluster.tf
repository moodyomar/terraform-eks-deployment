module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 18.0"

    cluster_name = "my_terra_cluster"
    cluster_version = "1.22"

    cluster_endpoint_private_access = true
    cluster_endpoint_public_access = true

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    eks_managed_node_group_defaults = {
        ami = var.ami

        attach_cluster_primary_security_group = true
        create_security_group = false
  }

    eks_managed_node_groups = {

# First Node
        one = {
        name = "my-node-group"

        instance_types = [var.instance_node]

        min_size     = 1
        max_size     = 3
        desired_size = 2

        pre_bootstrap_user_data = <<-EOT
        echo 'foo bar'
        EOT

        vpc_security_group_ids = [
            aws_security_group.cluster_sg.id
        ]
        }
# Second Node
        two = {
        name = "my-node-group-2"

        instance_types = [var.instance_node]

        min_size     = 1
        max_size     = 3
        desired_size = 2

        pre_bootstrap_user_data = <<-EOT
        echo 'foo bar'
        EOT

        vpc_security_group_ids = [
            aws_security_group.cluster_sg.id
        ]
        }

    }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}