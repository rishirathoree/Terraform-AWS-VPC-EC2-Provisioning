cd provisioning
mkdir vm
ssh-keygen -t rsa -b 4096 -f vm/mykey
cd environment/dev
terraform init
terraform plan
terraform apply --auto-approve
cd vm
chmod 600 mykey