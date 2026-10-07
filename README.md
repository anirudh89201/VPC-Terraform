# AWS Two-Tier Secure Architecture with Terraform

This repository contains Terraform configurations to deploy a secure, highly isolated two-tier web architecture on AWS. The project serves as an architectural implementation demonstrating core cloud networking, least-privilege security access, and Infrastructure as Code (IaC) best practices.

## 🏗️ Architecture Overview

The infrastructure isolates the database layer entirely from the public internet while allowing secure communication from the application/web layer.


## 🔒 Key Security Features

* **Network Isolation:** The EC2 instance is placed in a public subnet to accept external traffic, while the Amazon RDS instance is deployed into a private subnet, removing it entirely from public internet exposure.
* **Security Group Chaining:** The RDS instance's security group does not open generic ports to the world. It explicitly restricts inbound access by referencing the EC2 instance's security group ID as the *only* valid traffic source.
* **IAM Least Privilege:** Access management is handled cleanly via an IAM Instance Profile attached to the EC2 instance, granting it only the baseline permissions necessary to connect and authenticate with the database backend.

## 🛠️ Tech Stack

* **Cloud Provider:** Amazon Web Services (AWS)
* **Infrastructure as Code:** Terraform
* **Compute:** Amazon EC2
* **Database:** Amazon RDS (Relational Database Service)

## 🚀 How to Deploy

### Prerequisites
1. Installed [Terraform CLI](https://hashicorp.com).
2. Configured [AWS CLI](https://amazon.com) with appropriate administrative credentials.

### Steps
1. **Clone the repository:**
   ```bash
   git clone https://github.com
   cd your-repo-name
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Review the execution plan:**
   ```bash
   terraform plan
   ```

4. **Deploy the infrastructure:**
   ```bash
   terraform apply --auto-approve
   ```

5. **Clean up resources:**
   When you are done testing, destroy the resources to avoid unnecessary cloud costs:
   ```bash
   terraform destroy --auto-approve
   ```
