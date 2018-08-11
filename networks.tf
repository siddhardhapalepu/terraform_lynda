resource "aws_vpc" "environment-tf-example" {
	cidr_block = "10.0.0.0/16"
	enable_dns_hostnames = true
	enable_dns_support = true
	tags {
		Name = "terraform-aws-vpc-example"
	     }
}

resource "aws_security_group" "tf_subnet_security" {
	vpc_id = "${aws_vpc.environment-tf-example.id}"
	
	ingress {
		cidr_blocks = [
			"${aws_vpc.environment-tf-example.cidr_block}"
			      ]
		from_port = "80"
		to_port = "80"
		protocol = "tcp"
	        }

}
