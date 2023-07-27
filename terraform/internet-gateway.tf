
# Resource: aws_internet_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

# variable for the newly created vpc
# data "aws_vpc" "main" {
#   id = "vpc-0d7cc54a8f72ed8ab"
# }

resource "aws_internet_gateway" "main" {
  # Get the vpc id from the vpc.tf file where the aws_vpc is configured
  # The VPC ID to create in.
  vpc_id = aws_vpc.main.id

  # A map of tags to assign to the resource.
  tags = {
    Name = "main"
  }
}