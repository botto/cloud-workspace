#!/bin/bash

terraform plan -out workspace_plan.temp
terraform apply workspace_plan.temp
ANSIBLE_HOST_KEY_CHECKING=False env ansible-playbook -i terraform-inventory ansible/run.yml
