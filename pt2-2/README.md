# PT2.2: IGW, RTB i SG

## Objectiu 
Crea una infraestructura bàsica a AWS utilitzant Terraform que compleixi els requisits següents:

- Proveïdor i regió:
- VPC
- Subxarxes públiques:
- Internet Gateway i taula de rutes:
- Grup de seguretat:
- Instàncies EC2:

## Recursos
*   **Regió AWS:** us-east-1
*   **Tipus d'instància:** t3.micro 
*   **Sistema Operatiu:** Amazon Linux
*   **Quantitat:** 1 VPC, 2 Subxarxes públiques i 2 instàncies EC2.

# PREPARACIÓ DE L'ENTORN
**1. Configuració de Credencials AWS:** 
Configurem el AWS CLI amb **aws configure** introduint l'Access Key.
**nano ~/.aws/credentials** 

<img width="185" height="203" alt="image" src="https://github.com/user-attachments/assets/e365ff80-159a-446c-9a41-83d8ffa4a50a" />

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


*   **VPC:** La VPC **VPC-03** està creada
<img width="840" height="72" alt="image" src="https://github.com/user-attachments/assets/0dba3117-7baa-492c-a20a-f4b514e9f3ac" />

*   **SUBXARXES:** La subxarxa **Public Subnet B** i **Public Subnet A** estàn creades amb el rango 10.0.1.0/24 i 10.0.2.0/24
<img width="1169" height="77" alt="image" src="https://github.com/user-attachments/assets/b4466277-d202-423c-a734-eea135697a73" />

*   **GATEWAY I TAULA DE RUTES:** **rtb_pt2.2** està creada i associda a la VPC que dirigeix el trànsit cap a l'internet Gateway i està asociada a les 2 subnets
<img width="1166" height="102" alt="image" src="https://github.com/user-attachments/assets/a3f211fd-1048-4141-b28a-da8ec26bb4cd" />

*   **GRUP DE SEGURETAT:** El grup de seguretat **SG_Practica** està creat i es veu les inbound rules i outbound rules 
<img width="1107" height="407" alt="image" src="https://github.com/user-attachments/assets/b0ff5522-9505-44e5-be42-3a93a8af77c0" />
<img width="1169" height="372" alt="image" src="https://github.com/user-attachments/assets/83ffe787-cb17-46b2-acf9-e611a10452c3" />


*   **Instàncies EC2:** Les 2 instàncies A y B estan en estat **Running** t3.micro, parell de claus vockey i grup de seguretat creat
<img width="1169" height="261" alt="image" src="https://github.com/user-attachments/assets/9a5e23ee-66b9-40f0-b26c-a5a143b73abb" />


# FINAL: Neteja de recursos
Per evitar costos innecessaris al compte d'AWS, una vegada realitzades les comprovacions i captures de pantalla executem: 

**terraform destroy**
<img width="1023" height="309" alt="image" src="https://github.com/user-attachments/assets/5fca7fcd-2749-4e6e-a1c1-4efc2f5b50a2" />
