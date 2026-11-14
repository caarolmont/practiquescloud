# EXERCICI 2: VPC, Subxarxes i Instàncies EC2 amb Terraform 

## Objectiu 
Automatitzar la creació d'una infraestructura de xarxa a AWS utilitzant Terraform (IaC). Es desplega una VPC personalitzada, 3 subxarxes amb diferents màscares de xarxa i 6 instàncies EC2 distribuïdes (2 per subxarxa), connectades mitjançant interfícies de xarxa (ENI).

## Recursos
*   **Regió AWS:** us-east-1
*   **Tipus d'instància:** t3.micro 
*   **Sistema Operatiu:** Amazon Linux 2023
*   **Quantitat:** 1 VPC, 3 Subxarxes i 6 instàncies EC2.

# TOPOLOGIA
# PREPARACIÓ DE L'ENTORN
**1. Configuració de Credencials AWS:** 
Configurem el AWS CLI amb **aws configure** introduint l'Access Key.

![alt text](assets/{05D8426E-B4BA-4F91-8B2B-695C72A18E97}.png)

# INSTRUCCIONS D'EXECUCIÓ CODI TERRAFORM 

## Inicialitzacio del directori
Un cop tenim els fitchers main.tf creats amb el primer pas es inicialitzar el directori

**terraform init**

## Validacio i planificació 
Abans de crear els recursos validarem la sintaxis i visualitzar quins canvis farà terraform

**terraform validate** 

**terraform plan**
## Desplegament de la infraestructura
Un cop revisat el pla i confirmat que és correcte crearem la infraestructura a AWS

**terraform apply**

# VERIFICACIÓ CONSOLA AWS
Quan executem **terraform apply**, accedim a la consola de AWS per verificar que:


*   **VPC i Subxarxes:** La VPC **cm-VPC-principal** està creada amb les 3 subxarxes i els seus CIDR correctes
VPC

![alt text](assets/{B1D6B674-8A6E-457C-A397-98175D9E43DF}.png)

**SUBXARXES**

![alt text](assets/{C6219A48-3881-43DE-8A74-2930D0113C43}.png)
![alt text](assets/{3C8B4096-261C-4D39-A885-1887337AB2DF}.png)

*   **Instàncies EC2:** Les 6 instàncies estan en estat **Running**
![alt text](assets/{33938C57-E7C4-4027-B2B3-9270CBA3278C}.png)

# FINAL: Neteja de recursos
Per evitar costos innecessaris al compte d'AWS, una vegada realitzades les comprovacions i captures de pantalla executem: 

**terraform destroy**
