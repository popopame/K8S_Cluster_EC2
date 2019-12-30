# This file define the cluster

#Definition of the slave instance

resource "aws_instance" "K8S_Cluster_instance_slave" {
  instance_type          = var.K8S_Cluster_slave_instancetype
  ami                    = var.K8S_Cluster_ami_id
  subnet_id              = aws_subnet.K8S_Cluster_subnet_private_01.id
  vpc_security_group_ids = ["${aws_security_group.K8S_Cluster_cluster_SG.id}"]
  key_name               = "K8S_Cluster_key_cluster"

  user_data = file("./script/user_data_cluster.sh")


  count = var.K8S_Cluster_slave_count

  tags = {
    Name       = "K8S_Cluster_slave_${count.index}"
    project    = "K8S_Cluster"
    terraform  = ""
    kubernetes = "slave"
    ansible    = "kube-worker"
  }
}


#Definition of the masters instances

resource "aws_instance" "K8S_Cluster_instance_master" {
  instance_type          = var.K8S_Cluster_master_instancetype
  ami                    = var.K8S_Cluster_ami_id
  subnet_id              = aws_subnet.K8S_Cluster_subnet_private_01.id
  vpc_security_group_ids = ["${aws_security_group.K8S_Cluster_cluster_SG.id}"]
  key_name               = "K8S_Cluster_key_cluster"

  count     = var.K8S_Cluster_master_count
  user_data = file("./script/user_data_cluster.sh")


  tags = {
    Name       = "K8S_Cluster_master_${count.index}"
    project    = "K8S_Cluster"
    terraform  = ""
    kubernetes = "master"
    ansible    = "kube-master"
    ansible    = "kube-etcd"
  }
}
