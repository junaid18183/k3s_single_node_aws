data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_subnet" "public1" {
  for_each = data.aws_subnet_ids.default.ids
  id       = each.value
}

data "cloudinit_config" "userData" {
  part {
    content      = file("install_k3s.sh")
    content_type = "text/x-shellscript"
    filename     = "install_k3s.sh"
  }

}

resource "aws_instance" "k3s" {
  ami                         = data.aws_ami.amazon-2.id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = var.aws_ssh_key_name
  subnet_id                   = tolist(data.aws_subnet_ids.default.ids)[0]
  user_data                   = data.cloudinit_config.userData.rendered
  tags = {
    "Schedule" = var.schedule
    "Name"     = "${var.project}-k3s"
  }
  vpc_security_group_ids = [var.security_group_id]
  lifecycle {
    ignore_changes = [ebs_block_device]
  }
}
