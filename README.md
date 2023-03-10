# Terraform-Ansible-Project
### Implementing a highly available nginx reverse proxy. 
### The infrastructure was provisioned on AWS using Terraform as IaC. 
### The poxy configuration was managed using Ansible.

# AWS Architecture
### A private cloud in 2 different avalability zones ( each zone has a private subnet in addition to a public one), a suitable security group, an IGW, NAT GW and route tables were created. 
### An internet facing application load balancer was attached to the public subnets listening to http requests and targeting them towards two public instances in the different availabilty zones mentioned earlier.
### The 2 public instances were configured to work as Nginx reverse proxy to redirect the requests received from the internet facing ALB towards an internal application load balancer which is attached to the two private subnets.
### The internal ALB targets these requests to two private instances in the two availability zones mentioned earlier.
### When requesting the dns name of the internet facing ALB, the private instances' content is displayed in balance.


![image](https://user-images.githubusercontent.com/118319679/224304882-a23c2069-5515-431f-a6bd-f1606c10e2f8.png)


