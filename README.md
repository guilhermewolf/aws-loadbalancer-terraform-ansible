# aws-loadbalancer-terraform-ansible
Está é um repositorio contento os recursos para o provisionamento de infraestruturana AWS com o Terraform e uma playbook do Ansible para configurarmos uma aplicação web.

<div align="center" style="float: left">
  <img alt="chart" width="250" src="https://github.com/guilhermewolf/aws-loadbalancer-terraform-ansible/blob/master/estrutura.png" />
</div>


## Começamos baixando nossos arquivos
```shell
git clone https://github.com/guilhermewolf/aws-loadbalancer-terraform-ansible.git
```
# AWS
Será necessario possuir uma conta na AWS e criar as chaves de acesso para utilziarmos na configuração do AWS CLI
# AWS CLI
Para instalar o AWS CLI utilize a documentação oficial da Amazon (https://docs.aws.amazon.com/pt_br/cli/latest/userguide/install-cliv2.html)

Com o AWS CLI instalado basta fazer a configuração padrão dele
```shell
aws configure
```

### All set, let go!
```shell
terraform init
terraform apply
ansible-playbook playbook.yml
```

  > **Pré-requisitos:** Ansible, Git, Terraform
