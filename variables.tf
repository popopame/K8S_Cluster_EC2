#This file will contain all the variable refered in the Terraform files
#Only Edit this file

#access.tf variables

variable "region" {
  default = "us-east-2"
}

variable "profil" {
  default = "default"
}

#network.tf varriables

variable "K8S_Cluster_vpc_01_cidr" {
  default = "10.200.0.0/16"
}

variable "K8S_Cluster_subnet_public_01_cidr" {
  default = "10.200.1.0/24"
}

variable "K8S_Cluster_subnet_private_01_cidr" {
  default = "10.200.2.0/24"
}


#Cluster Variables

variable "K8S_Cluster_slave_count" {
  default = "10"
}

variable "K8S_Cluster_master_count" {
  default = "3"
}

variable "K8S_Cluster_slave_instancetype" {
  default = "t3.large"
}

variable "K8S_Cluster_master_instancetype" {
  default = "m5.xlarge"
}

variable "K8S_Cluster_ami_id" {
  default = "ami-0d5d9d301c853a04a" #this ami is the ubuntu 18.04 ami
}
