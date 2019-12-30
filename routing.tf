#This file will contain all the information for the root table

#Defintion of the private Route table


resource "aws_route_table" "K8S_Cluster_routetable_private_01" {
  vpc_id = aws_vpc.K8S_Cluster_vpc_01.id

  tags = {
    project   = "K8S_Cluster"
    terraform = ""
  }
}

resource "aws_route" "K8S_Cluster_route_subtoNGW_01" {
  route_table_id         = aws_route_table.K8S_Cluster_routetable_private_01.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.K8S_Cluster_ngw_01.id
}

#Association of the private route_table to the private subnet

resource "aws_route_table_association" "K8S_Cluster_private_routing_association" {
  subnet_id      = aws_subnet.K8S_Cluster_subnet_private_01.id
  route_table_id = aws_route_table.K8S_Cluster_routetable_private_01.id
}


#Defintion of the public Route table


resource "aws_route_table" "K8S_Cluster_routetable_public_01" {

  vpc_id = aws_vpc.K8S_Cluster_vpc_01.id


  tags = {
    project   = "K8S_Cluster"
    terraform = ""
  }
}

resource "aws_route" "K8S_Cluster_route_subtoIGW_01" {
  route_table_id         = aws_route_table.K8S_Cluster_routetable_public_01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.K8S_Cluster_IGW_01.id

}

#Association of the public route_table to the public subnet

resource "aws_route_table_association" "K8S_Cluster_public_routing_association" {
  subnet_id      = aws_subnet.K8S_Cluster_subnet_public_01.id
  route_table_id = aws_route_table.K8S_Cluster_routetable_public_01.id

}
