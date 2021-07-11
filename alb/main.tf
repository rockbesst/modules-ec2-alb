resource "aws_lb" "alb" {
 	name = "MainLoadBalancer"
 	load_balancer_type = "application"
 	security_groups = [var.asg_id]
 	subnets = [var.subnet_id]
}

 resource "aws_lb_listener" "listener_http" {
   load_balancer_arn = aws_lb.alb.arn
   port              = "80"
   protocol          = "HTTP"
   default_action {
     type             = "forward"
     target_group_arn = aws_lb_target_group.tg_main.arn
   }
 }
 resource "aws_lb_target_group" "tg_main" {
 	name     = "MainTargetGroup"
   	port     = 80
   	protocol = "HTTP"
   	vpc_id   = var.vpc_id
 }
 resource "aws_lb_target_group_attachment" "attach1_to_tg_main" {
 	target_group_arn = aws_lb_target_group.tg_main.arn
  	target_id        = var.ec2
   	port             = 80
  
 }