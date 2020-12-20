output "ssh_id" {
  description = "ID of the SSH SG"
  value       = aws_security_group.ssh_sg.id
}