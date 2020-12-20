locals {
helper_list = setproduct(
  var.ingress_ports,
  [for name, cidr in var.ip_map: [name, cidr]])
}

resource "aws_security_group" "ssh_sg" {
  name        = "CalebTesting-${var.deployment_name}-ssh_sg-${var.workspace}"
  description = "SSH Security Group for access to instances"
  vpc_id      = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    map(
      "Name", "CalebTesting-${var.deployment_name}-pubegg_sg-${var.workspace}"
    )
  )
}