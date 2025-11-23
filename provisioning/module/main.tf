resource "aws_vpc" "vpc_main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "Vpc for ${var.environment}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id  = aws_vpc.vpc_main.id
  cidr_block = var.subnet_cidr_block
  tags = {
    Name = "Public subnet for ${var.environment}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_main.id
  tags = {
    Name = "IGW-${var.environment}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public RT-${var.environment}"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  count          = var.public_subnet_count
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "sg" {
  name   = "sg_${var.environment}"
  vpc_id = aws_vpc.vpc_main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-${var.environment}"
  }
}

resource "aws_key_pair" "access_keypair" {
  key_name   = var.key_pair
  public_key = file("../../vm/${var.key_pair}.pub")
}

resource "aws_instance" "ec2-server" {
  ami = var.ami
  vpc_security_group_ids = [aws_security_group.sg.id]
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.public_subnet.id
  user_data = file("user_data.sh")
  tags = {
    Name = "ec2-test-${var.environment}"
  }
}
