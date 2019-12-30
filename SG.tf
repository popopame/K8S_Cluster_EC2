#This file will contain all the security group

#Secuirty group for the bastion host
resource "aws_security_group" "K8S_Cluster_bastion_SG" {
  name = "K8S_Cluster_bastion_SG"

  vpc_id = aws_vpc.K8S_Cluster_vpc_01.id

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    project   = "K8S_Cluster"
    terraform = ""
  }
}

#Security Group for the cluster


resource "aws_security_group" "K8S_Cluster_cluster_SG" {
  name        = "K8S_Cluster_cluster_SG"
  description = "SG for the cluster"
  vpc_id      = aws_vpc.K8S_Cluster_vpc_01.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    project   = "K8S_Cluster"
    terraform = ""
  }
}
