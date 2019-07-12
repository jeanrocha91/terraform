resource "aws_security_group" "autoscaling" {
    name = "autoscaling"
    description = "Security group that allows ssh/http and all egress traffic"
    vpc_id = "${aws_vpc.infrastructure.id}"

    ingress{
        from_port = 22
          to_port = 22
         protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        from_port = 8000
          to_port = 8000
         protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
          to_port = 0
         protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags{
        name = "Auto Scaling"
    }
}

resource "aws_launch_configuration" "this" {
    name_prefix = "autoscaling-launcher"
    image_id    = "ami-e0e2998c"
instance_type   = "t2.micro"
       key_name = "terraform-sp"
security_groups = ["${aws_security_group.autoscaling.id}"]
associate_public_ip_address = true
      user_data = "${file("ec2_setup.sh")}"

}

resource "aws_autoscaling_group" "this" {
                     name = "terraform-autoscaling"
      vpc_zone_identifier = ["${aws_subnet.sb_public_a.id}", "${aws_subnet.sb_public_c.id}"]
     launch_configuration = "${aws_launch_configuration.this.name}"
                 min_size = 2
                 max_size = 5                
health_check_grace_period = 300
        health_check_type = "ELB"
             force_delete = true
        target_group_arns = ["${aws_lb_target_group.tg.arn}"]
}


resource "aws_autoscaling_policy" "scaleup" {
                      name = "Scale-up"
    autoscaling_group_name = "${aws_autoscaling_group.this.name}"
           adjustment_type = "ChangeInCapacity"
        scaling_adjustment = "1"
                  cooldown = "300"
               policy_type = "SimpleScaling"
}

resource "aws_autoscaling_policy" "scaledown" {
                      name = "Scale down"
    autoscaling_group_name = "${aws_autoscaling_group.this.name}"
           adjustment_type = "ChangeInCapacity"
        scaling_adjustment = "-1"
                  cooldown = "300"
              policy_type = "SimpleScaling"
}