# Ec2-Using-Terraform
Create an EC2 instance on AWS using Terraform
we will see how to create an EC2 Instance using Terraform. Before proceeding, I assume that you are familiar with the basics of Terraform and AWS EC2 Instance.

# Pre-requisites
Basic understanding of Terraform.
Terraform installed on your system.
AWS Account (Create if you don’t have one).
'access_key' & 'secret_key' of an AWS IAM User.
Create a Key in aws and download it locally so that we can use it for login into machine.

# What we will do
Write Terraform configuration files for creating an EC2 Instance.
Create an EC2 using the Terraform configuration files.
Delete the created EC2 instance using Terraform.

Write Terraform configuration files to create an EC2 Instance

# mkdir terraform
# cd terraform/
Add your Aws Credentials using Environment variable 
# export AWS_ACCESS_KEY_ID=Abcdefgh12345
# export AWS_SECRET_ACCESS_KEY=/shj212tt18e1721e3ZfgwWRRp1Mx9KZ5G
Get all the code form github
# git clone https://github.com/akbhatisain/Ec2-Using-Terraform.git

Change your values in variable.tf
# vim  variables.tf
variable "awsprops" {
  type = map(string)
  default = {
    region = "us-east-1"
    ami   = "ami-08d4ac5b634553e16"
    itype = "t2.micro"
    key-name = "login-key.pem"
    vol_size  = "30"
    publicip     = true
    }
}

you can use an editor of your choice and copy paste the following configurations to create variables.tf, secgrp.tf and  main.tf.
Create 'main.tf' which is responsible to create an EC2  on to AWS. This main.tf will read values of variables from variables.tf and secgrp.tf.
After changing code accordingly to your requirement lets test the code.
Before you execute the following commands make sure you have configured the valid access_key and secret_key.
The first command to be used is 'terraform init'. This command downloads and installs plugins for providers used within the configuration. In our case it is AWS.

 # terraform init

The second command to be used is 'terraform plan'. This command is used to see the changes that will take place on the infrastructure.
 # terraform plan

'terraform apply' command will create the resources on the AWS mentioned in the main.tf file. You will be prompted to provide your input to create the resources.

# terraform apply
# Do you really want to destroy all resources?
#  Terraform will destroy all your managed infrastructure, as shown above.
#  There is no undo. Only 'yes' will be accepted to confirm.
  #  Enter a value: yes
# Apply complete! Resources: 2 added, 15 changed, 0 destroyed.

When you execute the above command,  you can see that new resource has been added and 0 has been destroyed in the output.

You can go to the AWS EC2 console to verify if theEC2 instance is created or not.


# Delete the created EC2 Instance using Terraform
If you no longer require resources you created using the configuration mentioned in the main.tf file, You can use the "terraform destroy" command to delete all those resources.

  # terraform destroy



