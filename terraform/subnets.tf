# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_1" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "192.168.0.0/18"
  # IP Range: 192.168.0.1 to 192.168.63.254

  # The AZ for the subnet.
  availability_zone = "us-west-2a"

  # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
  # Every new instance deployed to the public subnet will automatically receive public ip address
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name = "public-us-west-2a"
    # Allow other EKS cluster or other resources discover this cluster
    "kubernetes.io/cluster/eks" = "shared"
    # This tag allow private loadbalancer discovery by the subnets 
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "public_2" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  # Cider block starting from the next number
  cidr_block = "192.168.64.0/18"
  # IP Range: 192.168.64.1 to 192.168.127.254

  # The AZ for the subnet.
  availability_zone = "us-west-2b"

  # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                        = "public-us-west-2b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private_1" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "192.168.128.0/18"
  # IP Range: 192.168.128.1 to 192.168.191.254

  # The AZ for the subnet.
  availability_zone = "us-west-2a"

  # A map of tags to assign to the resource.
  tags = {
    Name                              = "private-us-west-2a"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_2" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = "192.168.192.0/18"
  # IP Range: 192.168.192.1 to 192.168.255.254

  # The AZ for the subnet.
  availability_zone = "us-west-2b"

  # A map of tags to assign to the resource.
  tags = {
    Name                              = "private-us-west-2b"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
# 💲 terraform fmt
# 💲 terraform plan
# 💲 terraform apply


# output "public_subnet_1_id" {
#   value       = aws_subnet.public_1.id
#   description = "ID of public subnet 1."
#   sensitive   = false
# }

# output "public_subnet_2_id" {
#   value       = aws_subnet.public_2.id
#   description = "ID of public subnet 2."
#   sensitive   = false
# }

# output "private_subnet_1_id" {
#   value       = aws_subnet.private_1.id
#   description = "ID of private subnet 1."
#   sensitive   = false
# }

# output "private_subnet_2_id" {
#   value       = aws_subnet.private_2.id
#   description = "ID of private subnet 2."
#   sensitive   = false
# }
