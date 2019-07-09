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
}
