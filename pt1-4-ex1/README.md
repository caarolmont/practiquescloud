# EXERCICI 1: Primeres instàncies EC2 amb Terraform 

## Objectiu 
Iniciació a l'Infrastructura com a Codi (IaC) utilitzant Terraform per a la creació automatitzada de recursos bàsics a AWS

## Recursos

*   **Región AWS:** us-east-1 
*   **Tipo de instancia:** t3.micro 
*   **Sistema Operativo:** Amazon Linux 2023
*   **Cantidad:** 2 instancias EC2

## PREPARACIÓ DEL ENTORN
**1. Configuració de CredencialS AWS:** Configurem el AWS CLI amb **aws configure**, introduim el Secret Access Key per permitir que Terraform es comuniqui amb AWS
(canvia cada dia, llavors cada dia has de tornar a introduir-la)

### Estructura del Código
El código se ha organizado de forma modular para cumplir con las buenas prácticas de Terraform:
*   `providers.tf`: Define el proveedor de AWS y la región.
*   `variables.tf`: Declara las variables (tipo de instancia, filtros de AMI) para evitar valores "hardcoded".
*   `main.tf`: Contiene la lógica principal (búsqueda de la AMI de Amazon Linux 2023, Security Group para permitir SSH y la creación de las 2 instancias).
*   `outputs.tf`: Muestra las IPs públicas y los IDs de las instancias una vez creadas.

### ⚙️ Flujo de trabajo de Terraform
Para desplegar la infraestructura, se han ejecutado los siguientes comandos en la terminal dentro de la carpeta `pt1-4-ex1`:

1.  **Formatear el código:** `terraform fmt` (Para asegurar una sintaxis limpia y estandarizada).
2.  **Inicializar:** `terraform init` (Descarga el plugin del proveedor de AWS).
3.  **Validar:** `terraform validate` (Comprueba que la sintaxis del código es correcta).
4.  **Planificar:** `terraform plan` (Muestra una vista previa de los recursos que se van a crear sin aplicarlos).
5.  **Aplicar:** `terraform apply` (Crea realmente los recursos en AWS tras confirmar con un `yes`).

### 🌐 Topología de Red
A continuación se muestra el diagrama de la topología diseñada en **draw.io**, utilizando la iconografía oficial de AWS:

![Topología de Red - Ejercicio 1](assets/topologia.png)

---

## ✅ 3. DESPUÉS DEL DESPLIEGUE (Verificación y Limpieza)

### 🔍 Verificación en la Consola de AWS
Una vez ejecutado el `terraform apply`, se ha accedido a la consola de AWS (Servicio EC2) para verificar que:
*   Las 2 instancias (`ejercicio1-instance-1` y `ejercicio1-instance-2`) están en estado **Running**.
*   El tipo de instancia es `t3.micro` y utilizan la AMI de Amazon Linux 2023.
*   Tienen asociado el Security Group que permite el tráfico SSH (puerto 22).

### 🧹 Limpieza de Recursos (Muy Importante)
Para evitar costes innecesarios en la cuenta de AWS, una vez realizadas las comprobaciones y capturas de pantalla, se ha procedido a destruir toda la infraestructura creada mediante el comando:
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

