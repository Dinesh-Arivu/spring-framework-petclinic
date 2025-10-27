# Generate keypair if public_key_path provided
resource "aws_key_pair" "deployer" {
  count = var.public_key_path != "" ? 1 : 0
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# Security group allowing SSH, HTTP, and MySQL (3306)
resource "aws_security_group" "pet_sg" {
  name        = "petclinic-sg"
  description = "Allow ssh, http, mysql"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For production, restrict to app VM only
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# App VM
resource "aws_instance" "app" {
  ami                    = var.app_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.pet_sg.id]
  tags = { Name = "petclinic-app" }
}

# DB VM
resource "aws_instance" "db" {
  ami                    = var.app_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.pet_sg.id]
  tags = { Name = "petclinic-db" }
}
