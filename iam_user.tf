resource "aws_iam_policy" "example_policy" {
  name        = "example-policy-${random_pet.example.id}"
  description = "An example IAM policy"
  policy      = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "ssm:StartSession",
          "ssm:TerminateSession",
          "ssm:ResumeSession",
          "ssm:DescribeSessions",
          "ssm:GetConnectionStatus",
          "ssm:DescribeInstanceInformation",
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceStatus",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:RebootInstances",
          "docker:*",
          "eks:*",
          "iam:CreateServiceLinkedRole",
          "iam:AttachRolePolicy",
          "iam:PutRolePolicy",
          "iam:AttachRolePolicy",
          "iam:AttachUserPolicy",
          "iam:CreateInstanceProfile",
          "iam:DeleteInstanceProfile",
          "iam:RemoveRoleFromInstanceProfile",
          "iam:AddRoleToInstanceProfile",
          "iam:RemoveUserFromGroup",
          "jenkins:*"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user" "example" {
  name = "example-${random_pet.example.id}"  # Using a unique identifier
}

resource "aws_iam_user_policy_attachment" "example_attachment" {
  user       = aws_iam_user.example.name
  policy_arn = aws_iam_policy.example_policy.arn
}

resource "aws_iam_role" "example_role" {
  name               = "example-role-${random_pet.example.id}"  # Using a unique identifier
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "example_attachment" {
  role       = aws_iam_role.example_role.name
  policy_arn = aws_iam_policy.example_policy.arn
}

resource "aws_iam_group" "new_group" {
  name = "new_group_name-${random_pet.example.id}"  # Using a unique identifier
}

resource "aws_iam_group_policy_attachment" "attach_group_policy" {
  group      = aws_iam_group.new_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_membership" "add_user_to_group" {
  name  = aws_iam_group.new_group.name
  users = [aws_iam_user.example.name]
  group = aws_iam_group.new_group.name
}

resource "random_pet" "example" {
  length    = 2
  separator = "-"
}
resource "aws_iam_instance_profile" "example_instance_profile" {
  name = "example-instance-profile-${random_pet.example.id}"  # Using a unique identifier

  role = aws_iam_role.example_role.name
}

