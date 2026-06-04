resource "aws_iam_policy" "alb_controller" {

  name = "${var.project_name}-alb-controller-policy"

  policy = file("${path.module}/iam-policy.json")

}

resource "aws_iam_role" "alb_controller" {

name = "${var.project_name}-alb-controller-role"


assume_role_policy = jsonencode({

Version = "2012-10-17"

Statement = [

{

Effect = "Allow"

Principal = {

Federated = var.oidc_provider_arn

}

Action = "sts:AssumeRoleWithWebIdentity"

}

]

})

}


resource "aws_iam_role_policy_attachment" "attach" {

role = aws_iam_role.alb_controller.name

policy_arn = aws_iam_policy.alb_controller.arn

}