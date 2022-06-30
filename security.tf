resource "aws_security_group" "rtmp-servers" {
  name = "rtmp-servers-sg"
  description = "Access for RTMP"
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    Name        = "rtmp-servers-sg"
    Role        = "public"
    Project     = "template"
    ManagedBy   = "terraform"
  }
}
 
resource "aws_security_group_rule" "rtmp_servers_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 
  security_group_id = aws_security_group.rtmp-servers.id
}
 
resource "aws_security_group_rule" "rtmp_servers_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rtmp-servers.id
}
 
resource "aws_security_group_rule" "rtmp_servers_in_rtmp" {
  type              = "ingress"
  from_port         = 1935
  to_port           = 1935
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rtmp-servers.id
}
 
resource "aws_security_group_rule" "rtmp_servers_in_udp" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rtmp-servers.id
}
 
