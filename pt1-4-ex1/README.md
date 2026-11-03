# EXERCICI 1: Primeres instàncies EC2 amb Terraform 

## Objectiu 
Iniciació a l'Infrastructura com a Codi (IaC) utilitzant Terraform per a la creació automatitzada de recursos bàsics a AWS

## Primers pasos

- hem de configurar el sistema per poder conectar-nos a AWS
    * Veiem les nostres credencials a AWS Details i les copiem i enganxem a la nostra terminal

- Creem main.tf i creem instàcies
    - Regió AWS: us-east-1
    - Tipus d'instància: t3.micro
    - Sistema Operatiu: Amazon Linux 2023
    - 2 Instàncies
- Inicialitzar repositori amb Terraform executat "terraform init"
- Finalment "terraform plan" terraform apply -auto-approve

