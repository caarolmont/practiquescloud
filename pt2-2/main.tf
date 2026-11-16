provider "aws" {
  region = "us-east-1"
}

#1. VPC

resource "aws_vpc" "VPC-03" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC-03"
  }
}

#2. Subnets A y B
resource "aws_subnet" "public_subnetA" {
  vpc_id                  = aws_vpc.VPC-03.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet A"
  }
}

resource "aws_subnet" "public_subnetB" {
  vpc_id                  = aws_vpc.VPC-03.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet B"
  }
}

#3. Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC-03.id
  tags = {
    Name = "IGW-VPC-03"
  }
}

#4. Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.VPC-03.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

#5. Route Table Associations
resource "aws_route_table_association" "public_subnetA_assoc" {
  subnet_id      = aws_subnet.public_subnetA.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnetB_assoc" {
  subnet_id      = aws_subnet.public_subnetB.id
  route_table_id = aws_route_table.public_rt.id
}

#6. Security Group
resource "aws_security_group" "sg_ssh_icmp_outbound" {
  name        = "sg_ssh_icmp_outbound"
  description = "Security group per practica pt2.2"
  vpc_id      = aws_vpc.VPC-03.id

  # Regla 1: SSH desde qualsevol lloc 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Regla 2: ICMP només des de dins de la VPC
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  # Regla 3: Tràfic de sortida 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-Practica"
  }
}

#7. Instancia EC2 en Subnet A
resource "aws_instance" "ec2_a" {
  ami                    = "ami-0567589d25e06853e"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnetA.id
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.sg_ssh_icmp_outbound.id]
  tags = {
    Name = "ec2-a"
  }
}

#8. Instancia EC2 en Subnet B
resource "aws_instance" "ec2_b" {
  ami                    = "ami-0567589d25e06853e"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnetB.id
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.sg_ssh_icmp_outbound.id]
  tags = {
    Name = "ec2-b"
  }
}


