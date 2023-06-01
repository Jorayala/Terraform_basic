resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demoo-vpc202264636346"
    Purpose = "Jenkins Demo 6"
  }
}
