
# Resource: aws_eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "nat1" {
  # EIP may require IGW to exist prior to association. 
  # Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "nat1-eip"
  }
}

resource "aws_eip" "nat2" {
  # EIP may require IGW to exist prior to association. 
  # Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "nat1-eip"
  }
}


output "aws_eip_nat1" {
  value = {
    public_ip = aws_eip.nat1.public_ip
    Name      = aws_eip.nat1.tags.Name
  }
  description = "Elastic IP Nat 1"
  sensitive   = false
}

output "aws_eip_nat2" {
  value = {
    public_ip = aws_eip.nat2.public_ip
    name      = aws_eip.nat2.tags.Name
  }
  description = "Elastic IP Nat 2"
  sensitive   = false
}