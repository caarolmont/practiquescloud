provider "aws" {
  region = "us-east-1"
}   

#Red, vpc y subnets

resource "aws_vpc" "cm_VPC" {
  region = "us-east-1"
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "cm-VPC-principal"
  }
}

resource "aws_subnet" "cm_subnetA" {
  vpc_id = aws_vpc.cm_VPC.id
  cidr_block = "10.0.32.0/25"
  availability_zone = "us-east-1a"
  tags = {
    Name = "cm-SubnetA"
  }
}

resource "aws_subnet" "cm_subnetB" {
  vpc_id = aws_vpc.cm_VPC.id
  cidr_block = "10.0.30.0/23"
  availability_zone = "us-east-1a"
  tags = {
    Name = "cm-SubnetB"
  }
}

resource "aws_subnet" "cm_subnetC" {
  vpc_id = aws_vpc.cm_VPC.id
  cidr_block = "10.0.33.0/28"
  availability_zone = "us-east-1a"
  tags = {
    Name = "cm-SubnetC"
  }
}

#Instancias en subnet A

resource "aws_network_interface" "cm_nic_a1" {
  subnet_id = aws_subnet.cm_subnetA.id
  tags = {
    Name = "cm-NIC-A1-SubnetA"
  }
}

resource "aws_instance" "cm_ec2_a1" {
  primary_network_interface {
    network_interface_id = aws_network_interface.cm_nic_a1.id
  }

  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  tags = {
    Name = "cm-EC2-A1-SubnetA"
  }
}

resource "aws_network_interface" "cm_nic_a2" {
  subnet_id = aws_subnet.cm_subnetA.id
  tags = {
    Name = "cm-NIC-A2-SubnetA"
  }
}

resource "aws_instance" "cm_ec2_a2" {
  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"

  primary_network_interface {
    network_interface_id = aws_network_interface.cm_nic_a2.id
  }

  tags = {
    Name = "cm-EC2-A2-SubnetA"
  }
}

#Instancias en subnet b

resource "aws_network_interface" "cm_nic_b1" {
  subnet_id = aws_subnet.cm_subnetB.id
  tags = {
    Name = "cm-NIC-B1-SubnetB"
  }
}

resource "aws_instance" "cm_ec2_b1" {
  primary_network_interface {
    network_interface_id = aws_network_interface.cm_nic_b1.id
  }

  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  tags = {
    Name = "cm-EC2-B1-SubnetB"
  }
}

resource "aws_network_interface" "cm_nic_b2" {
  subnet_id = aws_subnet.cm_subnetB.id
  tags = {
    Name = "cm-NIC-B2-SubnetB"
  }
}

resource "aws_instance" "cm_ec2_b2" {
  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"

  primary_network_interface {
    network_interface_id = aws_network_interface.cm_nic_b2.id
  }

  tags = {
    Name = "cm-EC2-B2-SubnetB"
  }
}

#Instanias en subnet C

resource "aws_network_interface" "cm_nic_c1" {
  subnet_id = aws_subnet.cm_subnetC.id
  tags = {
    Name = "cm-NIC-C1-SubnetC"
  }
}

resource "aws_instance" "cm_ec2_c1" {
  primary_network_interface {
    network_interface_id = aws_network_interface.cm_nic_c1.id
  }

  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  tags = {
    Name = "cm-EC2-C1-SubnetC"
  }
}

resource "aws_network_interface" "cm_nic_c2" {
  subnet_id = aws_subnet.cm_subnetC.id
  tags = {
    Name = "cm-NIC-C2-SubnetC"
  }
}

resource "aws_instance" "cm_ec2_c2" {
  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"

  primary_network_interface {
    network_interface_id = aws_network_interface.cm_nic_c2.id
  }

  tags = {
    Name = "cm-EC2-C2-SubnetC"
  }
}