resource "aws_vpc" "environment-tf-example" {
	cidr_block = "10.0.0.0/16"
	enable_dns_hostnames = true
	enable_dns_support = true
	tags {
		Name = "terraform-aws-vpc-example"
	     }
}
resource "aws_subnet" "tf_subnet1" {
	cidr_block = "${cidrsubnet(aws_vpc.environment-tf-example.cidr_block, 3, 1)}"
	vpc_id = "${aws_vpc.environment-tf-example.id}"
	availability_zone = "us-east-1a"

}
resource "aws_subnet" "tf_subnet2" {
        cidr_block = "${cidrsubnet(aws_vpc.environment-tf-example.cidr_block, 2, 2)}"
        vpc_id = "${aws_vpc.environment-tf-example.id}"
        availability_zone = "us-east-1b"

}
resource "aws_security_group" "tf_subnet_security" {
	vpc_id = "${aws_vpc.environment-tf-example.id}"
	
	ingress {
		cidr_blocks = [
			"${aws_vpc.environment-tf-example.cidr_block}"
			      ]
		from_port = 80
		to_port = 80
		protocol = tcp
	        }

}
