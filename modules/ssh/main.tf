locals {
helper_list = setproduct(
  var.ingress_ports,
  [for name, cidr in var.ip_map: [name, cidr]])
}

resource "aws_security_group" "ssh_sg" {
  name        = "CalebTesting-${var.deployment_name}-ssh_sg-${var.workspace}"
  description = "SSH Security Group for access to instances"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = {for idx, item in local.help_list: idx=>item}
    content {
      from_port   = ingress.value[0]
      to_port     = ingress.value[0]
      protocol    = "tcp"
      cidr_blocks = [ingress.value[1][1]]
      description = ingress.value[1][0]
    }
  }

  tags = merge(
    var.tags,
    map(
      "Name", "CalebTesting-${var.deployment_name}-ssh_sg-${var.workspace}"
    )
  )
}