# Cloud workspace
This is a basic provisioner with some utility scripts

Very early rough stage but....want to make it as easy as possible for someone to get a nix based workspace set up in the cloud

I have tested this with both google cloud and digital ocean, however I'm actively developing on google cloud, digital ocean sometimes takes 5-10 min before an instances spawns so quite annoying.

## Getting started

This will tell you the steps to get started with google cloud

What you need 
- Credentials file  
- Project machine name  
- Region name  

1. First register/sign in with google cloud https://cloud.google.com
2. Create a project
3. Click on my console
4. Click on burger to the left and chose API Manager
5. Create new key, select service account key
6. Just use the default compute engine account
7. Select json key type
8. Save the json file as `gc_crenditals.json` in the root of the project
9. The project name can be found in the url ?project=<projectname>
10. For the region you can find a nice overview here https://cloud.google.com/compute/docs/zones#available
11. I would say pick the one that is closest to you
12. Fill out workspace_config.tf.json with the project and region
13. Run `terraform plan` and look at what it's going to do
14. Run `terraform apply` and it will set up the env
15. Run `ansible-playbook -i terraform-inventory ansible/run.yml`

This is too many steps, but for now it's going to be like this, eventually want to make this only 2-3 steps after registration
