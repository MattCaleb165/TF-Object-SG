resource "aws_security_group" "pubegg_sg" {
  name        = "CalebTesting-${var.deployment_name}-pubegg_sg-${var.workspace}"
  description = "Egress security group allowing the aws instances to send data out to the internet"
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