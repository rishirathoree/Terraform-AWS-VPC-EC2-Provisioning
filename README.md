# AWS & Terraform Setup Guide (macOS)

This project provides a quick setup for installing **AWS CLI**,
configuring AWS credentials, installing **Terraform**, and preparing
your environment using a `setup.sh` script.

## 🚀 Install AWS CLI

``` sh
brew install awscli
```

Verify the installation:

``` sh
aws --version
```

## 🔐 Configure AWS CLI

``` sh
aws configure
```

Enter:

AWS Access Key ID: MYACCESSKEY\
AWS Secret Access Key: MYSECRETKEY\
Default region name \[ap-south-1\]: ap-south-1\
Default output format \[None\]: json

## 🧱 Install Terraform

``` sh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

Verify:

``` sh
terraform -version
```

## ▶️ Make setup.sh Executable

``` sh
chmod +x setup.sh
./setup.sh
```

 go to your **AWS Console → EC2 → Instances** and check the
Public IP of the running instance.

execute the cmd :
``` sh
ssh -i mykey ubuntu@yourip
./setup.sh
```