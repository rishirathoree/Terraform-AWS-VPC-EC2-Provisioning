variable "environment" {
    type = string
    description = "Your environment"
}

variable "vpc_cidr_block" {
    type = string
    description = "Vpc cidr block"
}

variable "subnet_cidr_block" {
    type = string
    description = "subnet cidr block"
}

variable "public_subnet_count" {
    type = number
    description = "Public subnet count"
}

variable "ami" {
    type = string
    description = "ami id"
}

variable "key_pair" {
    type = string
    description = "key pair"
}

variable "instance_type" {
    type = string
    description = "instance type"
}