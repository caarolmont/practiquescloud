provider "aws" {
  region = "us-east-1"
}   

resource "aws_vpc" "zerotwoVPC" {
  region = "us-east-1"
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "02-VPC"
  }
}

resource "aws_subnet" "subnetA" {
  vpc_id = aws_vpc.zerotwoVPC.id
  cidr_block = "10.0.32.0/25"
  availability_zone = "us-east-1a"
  tags = {
    Name = "zerotwoSubnetA"
  }
}

resource "aws_subnet" "subnetB" {
  vpc_id = aws_vpc.zerotwoVPC.id
  cidr_block = "10.0.30.0/23"
  availability_zone = "us-east-1a"
  tags = {
    Name = "zerotwoSubnetB"
  }
}

resource "aws_subnet" "subnetC" {
  vpc_id = aws_vpc.zerotwoVPC.id
  cidr_block = "10.0.33.0/28"
  availability_zone = "us-east-1a"
  tags = {
    Name = "zerotwoSubnetC"
  }
}

resource "aws_network_interface" "ifAsubA" {
  subnet_id = aws_subnet.subnetA.id
  tags = {
    Name = "Interface A Subnet A"
  }
}

resource "aws_instance" "ecAsubA" {
  primary_network_interface {
    network_interface_id = aws_network_interface.ifAsubA.id
  }

  ami = "ami-052064a798f08f0d3"
  instance_type = "t3.micro"
  tags = {
    Name = "ecA subnet A"
  }
}

resource "aws_network_interface" "ifBsubA" {
  subnet_id = aws_subnet.subnetA.id
  tags = {
    Name = "Interface B Subnet A"
  }
}

resource "aws_instance" "ecBsubA" {
  ami = "ami-052064a798f08f0d3"
  instance_type = "t3.micro"

  primary_network_interface {
    network_interface_id = aws_network_interface.ifBsubA.id
  }

  tags = {
    Name = "ecB subnet A"
  }
}

resource "aws_network_interface" "ifAsubB" {
  subnet_id = aws_subnet.subnetA.id
  tags = {
    Name = "Interface A Subnet B"
  }
}

resource "aws_instance" "ecAsubB" {
  primary_network_interface {
    network_interface_id = aws_network_interface.ifAsubB.id
  }

  ami = "ami-052064a798f08f0d3"
  instance_type = "t3.micro"
  tags = {
    Name = "ecA subnet B"
  }
}

resource "aws_network_interface" "ifBsubB" {
  subnet_id = aws_subnet.subnetA.id
  tags = {
    Name = "Interface B Subnet B"
  }
}

resource "aws_instance" "ecBsubB" {
  ami = "ami-052064a798f08f0d3"
  instance_type = "t3.micro"

  primary_network_interface {
    network_interface_id = aws_network_interface.ifBsubB.id
  }

  tags = {
    Name = "ecB subnet B"
  }
}

resource "aws_network_interface" "ifAsubC" {
  subnet_id = aws_subnet.subnetA.id
  tags = {
    Name = "Interface A Subnet C"
  }
}

resource "aws_instance" "ecAsubC" {
  primary_network_interface {
    network_interface_id = aws_network_interface.ifAsubC.id
  }

  ami = "ami-052064a798f08f0d3"
  instance_type = "t3.micro"
  tags = {
    Name = "ecA subnet C"
  }
}

resource "aws_network_interface" "ifBsubC" {
  subnet_id = aws_subnet.subnetA.id
  tags = {
    Name = "Interface B Subnet C"
  }
}

resource "aws_instance" "ecBsubC" {
  ami = "ami-052064a798f08f0d3"
  instance_type = "t3.micro"

  primary_network_interface {
    network_interface_id = aws_network_interface.ifBsubC.id
  }

  tags = {
    Name = "ecB subnet C"
  }
}