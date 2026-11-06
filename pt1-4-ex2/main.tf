provider "aws" {
  region = "us-east-1"
}

# 1. RED, VPC y Subnets
resource "aws_vpc" "cm_VPC" {
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

# 2. INSTANCIAS (6)

# Subnet A
resource "aws_instance" "cm_ec2_a1" {
  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.cm_subnetA.id # <--- ¡Asignación directa!
  tags = { 
    Name = "cm-EC2-A1-SubnetA" 
    }
}

resource "aws_instance" "cm_ec2_a2" {
  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.cm_subnetA.id
  tags = { 
    Name = "cm-EC2-A2-SubnetA" 
    }
}

# Subnet B
resource "aws_instance" "cm_ec2_b1" {
  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.cm_subnetB.id # <--- ¡Sin errores de copiar/pegar!
  tags = { 
    Name = "cm-EC2-B1-SubnetB" 
    }
}

resource "aws_instance" "cm_ec2_b2" {
  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.cm_subnetB.id
  tags = { 
    Name = "cm-EC2-B2-SubnetB" 
    }
}

# Subnet C
resource "aws_instance" "cm_ec2_c1" {
  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.cm_subnetC.id # <--- ¡Sin errores de copiar/pegar!
  tags = { 
    Name = "cm-EC2-C1-SubnetC" 
    }
}

resource "aws_instance" "cm_ec2_c2" {
  ami = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.cm_subnetC.id
  tags = { 
    Name = "cm-EC2-C2-SubnetC" 
    }
}