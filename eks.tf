module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 20.31"

    cluster_name    = var.cluster_name
    cluster_version = "1.31"

    cluster_endpoint_public_access = true

    enable_cluster_creator_admin_permissions = true

    cluster_compute_config = {
        enabled = true
        node_pools = ["general-purpose"]
    }

    eks_managed_node_groups = {
        ng1 = {
            launch_template = "ng1"
            version         = 1.31
            disired_size    = 1
            max_size        = 1
            min_size        = 1
            instance_types  = ["t2.small"]
            k8s_labels = {}

        }
    }

    vpc_id = aws_vpc.vpc.id
    subnet_ids = [
        aws_subnet.private_subnets["private-subnet-1"].id,
        aws_subnet.private_subnets["private-subnet-2"].id,
    ]

    tags = {
    Environment = "dev"
    Terraform   = "true"
  }

}