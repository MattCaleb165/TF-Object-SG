output "egress_id" {
  description = "ID of the egress SG"
  value       = aws_security_group.pubegg_sg.id
}