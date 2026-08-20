resource "aws_key_pair" "bootcamp" {
  key_name   = "${var.project_name}-key"
  public_key = file("${path.module}/eks-bootcamp-key.pub")

  tags = {
    Name    = "${var.project_name}-key"
    Project = var.project_name
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "bootcamp" {
  ami                    = "ami-083366ec0ea814e87"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = aws_key_pair.bootcamp.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2_ecr.name

  associate_public_ip_address = false

  tags = {
    Name    = "${var.project_name}-ec2"
    Project = var.project_name
  }
}