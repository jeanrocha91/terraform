
# Terraform

Projeto desenvolvido para a vaga de Cloud Engineer.

A automação de init e destroy da infraestrutura foi automatizada via crontab no linux (https://drive.google.com/open?id=1t4fcCH9qDTPv8GZ_Xks9UT-3pRtEPztD).

Para que a aplicação seja iniciada corretamente, deve-se corrigir o destinos das pastas, o projeto contém Load Balancer, Auto Scaling, VPC, EC2 e CloudWatch. Para que a aplicação funcione é necessário:

#---> Instalar AWS CLI (https://docs.aws.amazon.com/pt_br/cli/latest/userguide/install-linux.html)
#---> Instalar Terraform (https://learn.hashicorp.com/terraform/getting-started/install.html)
#---> Configurar acesso de usuário AWS

Para configuração de inicialização do projeto do terraform, é necessário:

        ---> Dentro da pasta do projeto dar um "terraform init"
        ---> Logo após, "terraform plan"
        ---> Para construção da infraestrutura e deploy "terraform apply -auto-approve"

Todo o projeto foi construído em cima do Terraform, em caso de dúvida, entrar em contato.
