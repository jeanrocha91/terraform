<<<<<<< HEAD
locals {
  tags = {
    Name = "Terraform"
  }
}

resource "aws_vpc" "infrastructure" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  tags             = "${local.tags}"
}

resource "aws_subnet" "sb_public_a" {
  vpc_id            = "${aws_vpc.infrastructure.id}"
  cidr_block        = "192.168.1.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "Public 1a"
  }
}

resource "aws_subnet" "sb_public_c" {
  vpc_id            = "${aws_vpc.infrastructure.id}"
  cidr_block        = "192.168.2.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "Public 1c"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.infrastructure.id}"
  tags   = "${local.tags}"
}

resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.infrastructure.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = "${local.tags}"
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = "${aws_subnet.sb_public_a.id}"
  route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = "${aws_subnet.sb_public_c.id}"
  route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow public inbound traffic"
  vpc_id      = "${aws_vpc.infrastructure.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${local.tags}"
=======
resource "aws_vpc" "infrastructure"{  

	cidr_block = "10.0.0.0/16"  
	instance_tenancy = "default"    

	tags{    
		Name = "VPC by Terraform"
	}
}

resource "aws_subnet" "infrastructure"{

	vpc_id = "${aws_vpc.infrastructure.id}"
	cidr_block = "10.0.0.0/24"

	tags{
		Name = "Subnet by Terraform"
	}
}

resource "aws_internet_gateway" "infrastructure"{

	vpc_id = "${aws_vpc.infrastructure.id}"
 
	tags{
		Name = "Internet Gateway by Terraform"
	}
}

resource "aws_route_table" "infrastructure"{

	vpc_id = "${aws_vpc.infrastructure.id}"
 
	route{
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.infrastructure.id}"
	}
 
	tags{
		Name = "Route Table by Terraform"
	}
}
 
resource "aws_route_table_association" "infrastructure"{

	subnet_id      = "${aws_subnet.infrastructure.id}"
	route_table_id = "${aws_route_table.infrastructure.id}"
>>>>>>> 72ce1cd0915a1529b2d077e2c70239c420355d66
}
