#1. Outputs
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.VPC-03.id
}
output "ec2_a_public_ip" {
  description = "IP pública de la instancia EC2 en Subnet A"
  value = aws_instance.ec2_a.public_ip
}   

output "ec2_b_public_ip" {
  description = "IP pública de la instancia EC2 en Subnet B"
  value = aws_instance.ec2_b.public_ip
}   
