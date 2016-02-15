#!/bin/bash

trap 'if [ -e workspace_plan.temp ]; then rm workspace_plan.temp; fi' EXIT

terraform plan -out workspace_plan.temp
if [ -e workspace_plan.temp ]; then
  terraform apply workspace_plan.temp
fi
ANSIBLE_HOST_KEY_CHECKING=False env ansible-playbook -i terraform-inventory ansible/run.yml

exit 0
