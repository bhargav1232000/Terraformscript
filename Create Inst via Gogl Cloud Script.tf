resource "aws_instance" "web" {
  ami           = "${var.image1}"
  instance_type = "t2.micro"
  subnet_id = "subnet-0cd1a27207327c234"

  tags = {
    Name = "HelloWorld"
  }
}
#subnet
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example" {
  vpc_id                  = "${aws_vpc.example.id}"
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"  # Change this to your desired availability zone

  map_public_ip_on_launch = true
}

output "subnet_id" {
  value = aws_subnet.example.id
}
