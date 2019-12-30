#This file contain all the ressources linked to network

resource "aws_vpc" "K8S_Cluster_vpc_01" {
  cidr_block                       = var.K8S_Cluster_vpc_01_cidr
  assign_generated_ipv6_cidr_block = true

  tags = {
    project   = "K8S_Cluster"
    terraform = ""
  }
}

resource "aws_internet_gateway" "K8S_Cluster_IGW_01" {
  vpc_id = aws_vpc.K8S_Cluster_vpc_01.id

  tags = {
    project   = "K8S_Cluster"
    terraform = ""
  }
}

#Declaration of the subnets

resource "aws_subnet" "K8S_Cluster_subnet_public_01" {
  vpc_id     = aws_vpc.K8S_Cluster_vpc_01.id
  cidr_block = var.K8S_Cluster_subnet_public_01_cidr

  tags = {
    project   = "K8S_Cluster"
    terraform = ""
  }
}

resource "aws_subnet" "K8S_Cluster_subnet_private_01" {
  vpc_id     = aws_vpc.K8S_Cluster_vpc_01.id
  cidr_block = var.K8S_Cluster_subnet_private_01_cidr

  tags = {
    project   = "K8S_Cluster"
    terraform = ""
  }
}

# Declartion of the Nat Gateway and it's elastic_ip

resource "aws_eip" "K8S_Cluster_eip_ngw_01" {
  vpc = true

  tags = {
    project   = "K8S_Cluster"
    terraform = ""
    nat       = "nat"
  }
}

resource "aws_nat_gateway" "K8S_Cluster_ngw_01" {
  allocation_id = aws_eip.K8S_Cluster_eip_ngw_01.id
  subnet_id     = aws_subnet.K8S_Cluster_subnet_public_01.id

  tags = {
    project   = "K8S_Cluster"
    terraform = ""
    nat       = "nat"
  }

}

#Declaration of the Bastion

resource "aws_instance" "K8S_Cluster_bastion_01" {
  instance_type               = "t2.micro"
  ami                         = var.K8S_Cluster_ami_id
  subnet_id                   = aws_subnet.K8S_Cluster_subnet_public_01.id
  vpc_security_group_ids      = ["${aws_security_group.K8S_Cluster_bastion_SG.id}"]
  key_name                    = "K8S_Cluster_key_bastion"
  associate_public_ip_address = true
  user_data                   = file("./script/user_data_bastion.sh")

  tags = {
    project   = "K8S_Cluster"
    terraform = ""
    bastion   = ""
    Name      = "K8S_Cluster_bastion_01"
  }
}
