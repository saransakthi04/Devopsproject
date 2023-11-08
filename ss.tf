# First create ssh keys in current directory using
# ssh-keygen -f terraform_ec2_key
# This will create two files in current directory
# 1. terraform_ec2_key
# 2. terraform_ec2_key.pub

# Now create instance which will use these keys
### vim instance-with-ssh-keys.tf ####

provider "aws" {
  region     = "ap-southeast-2"
}


resource "aws_instance" "Test-Server" {
  ami           = "ami-07b5c2e394fccab6e"
  instance_type = "t2.micro"
  
  tags = {
Name = "Saranya-Server"
}
}


#### file ends here ####
# terraform validate
# terraform plan
# terraform apply
# Once the ec2 instance is created, go to aws dashboard
# copy the ssh command (remove .pem) 
# ssh -i "terraform_ec2_key" ec2-user@your-ip-address
# 
# finally destroy everything
# terraform destroy
