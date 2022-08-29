resource "aws_security_group" "cluster_sg" {
  name        = "My Cluster sg"
  description = "Custom security group for my cluster"
  
#   connect security group to custom vpc
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "ssh connection"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "http connection"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_cluster_sg"
  }
}