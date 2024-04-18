resource "aws_iam_group" "new_group" {
  name = "new_group_name"
}

resource "aws_iam_group_policy_attachment" "attach_group_policy" {
  group      = aws_iam_group.new_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"  # Example policy, replace with your desired policy ARN
}
