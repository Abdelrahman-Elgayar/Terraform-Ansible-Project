data "aws_ami" "ami" {
   most_recent = true
   owners = ["amazon"]
   filter {
    name = "name"
    values = [
        "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*",
    ]
   }
}

resource "aws_instance" "public_instance1" {
  ami             = data.aws_ami.ami.image_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet1_id
  vpc_security_group_ids = var.sg_id
  key_name        = var.key_pair

#   user_data = "${file(var.user_data)}"

  tags = {
    Name = var.instance_name[0]
  }

  volume_tags = {
    Name = var.volume_name[0]
  }


  provisioner "local-exec" {
  #working_dir = "drives\\G:\\My Data\\Desktop\\ITI\\19.Ansible&Terraform\\Day3\\Terraform-Project"
  command = "echo public-ip1    ${self.public_ip} >> all-ips.txt"
}  
}

resource "aws_instance" "private_instance1" {
  ami             = data.aws_ami.ami.image_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet2_id
  vpc_security_group_ids = var.sg_id
  key_name        = var.key_pair

#   user_data = "${file(var.user_data)}"

  tags = {
    Name = var.instance_name[1]
  }

  volume_tags = {
    Name = var.volume_name[1]
  } 
  # provisioner "remote-exec" {
  #     inline = [
  #       "sudo apt update -y",
  #       "sudo apt install apache2 -y",
  #       "sudo echo '<h1>This is executed by terraform on $(hostname -f)</h1>'> /var/www/html/index.html",
  #     ]



  #     connection {
  #       host        = self.private_ip
  #       type        = "ssh"
  #       user        = "ubuntu"
  #       private_key = file("ssh-public.pem")
  #     }
  #   }

  provisioner "local-exec" {
  #working_dir = "/drives/g/My\ Data/Desktop/ITI/19.Ansible\&Terraform/Day3/Terraform-Project"
  command = "echo private-ip1    ${self.private_ip} >> all-ips.txt"
}
}


resource "aws_instance" "public_instance2" {
  ami             = data.aws_ami.ami.image_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet3_id
  vpc_security_group_ids = var.sg_id
  key_name        = var.key_pair

#   user_data = "${file(var.user_data)}"

  tags = {
    Name = var.instance_name[2]
  }

  volume_tags = {
    Name = var.volume_name[2]
  } 

  provisioner "local-exec" {
  command = "echo public-ip2    ${self.public_ip} >> all-ips.txt"
}
}


resource "aws_instance" "private_instance2" {
  ami             = data.aws_ami.ami.image_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet4_id
  vpc_security_group_ids = var.sg_id
  key_name        = var.key_pair

#   user_data = "${file(var.user_data)}"

  tags = {
    Name = var.instance_name[3]
  }

  volume_tags = {
    Name = var.volume_name[3]
  } 
  # provisioner "remote-exec" {
  #     inline = [
  #       "sudo apt update -y",
  #       "sudo apt install apache2 -y",
  #       "sudo echo '<h1>This is executed by terraform on $(hostname -f)</h1>'> /var/www/html/index.html",
  #     ]



  #     connection {
  #       host        = self.private_ip
  #       type        = "ssh"
  #       user        = "ubuntu"
  #       private_key = file("ssh-public.pem")
  #     }
  #   }

  provisioner "local-exec" {
  command = "echo private-ip2    ${self.private_ip} > all-ips.txt"
}
}
