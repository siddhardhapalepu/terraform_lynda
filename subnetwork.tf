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
