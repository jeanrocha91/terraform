resource "aws_instance" "teste"{

	ami                         = "ami-e0e2998c"
	instance_type               = "t2.micro"
	key_name                    = "terraform-sp"
	subnet_id                   = "${aws_subnet.infrastructure.id}"
	security_groups             = ["${aws_security_group.teste-sg.id}"]
	associate_public_ip_address = true
 
	tags{
		Name = "Instance by Terraform"
  }
}
 
resource "aws_security_group" "teste-sg"{

	name   = "teste-sg"
	vpc_id = "${aws_vpc.infrastructure.id}"
 
	egress{
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
 
	ingress{
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
 
	tags{
		Name = "Security Group teste-sg by Terraform"
	}
}
