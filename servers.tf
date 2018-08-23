data "aws_ami" "ubuntu" {
	most_recent = true
	
	filter {
	  name = "name"
	  values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
	       }
	filter {
	   name = "virtualization-type"
	   values = ["hvm"]
              }
	owners = ["099720109477"]
}

resource "aws_instance" "first_tf_server" {
	ami = "${data.aws_ami.ubuntu.id}"
	instance_type = "t2.micro"

	tags {
	  Name = "tf_ubuntu_server"
	     }
	subnet_id = "${aws_subnet.tf_subnet2.id}"
}
