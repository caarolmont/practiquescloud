provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "maquina1" {
  ami           = "ami-0567589d25e06853e"
  instance_type = "t3.micro"

  tags = {
    Name = "maquina1"
  }
}

resource "aws_instance" "maquina2" {
  ami           = "ami-0567589d25e06853e"
  instance_type = "t3.micro"

  tags = {
    Name = "maquina2"
  }
}
