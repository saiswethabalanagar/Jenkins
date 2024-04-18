resource "aws_iam_group" "new_group" {
  name = "new_group_name"
}
resource "aws_iam_group_policy_attachment" "attach_group_policy" {
  group      = aws_iam_group.new_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"  # Example policy, replace with your desired policy ARN
}
resource "aws_iam_group_membership" "add_user_to_group" {
  name  = aws_iam_group.new_group.name
  users = [aws_iam_user.new_user.name]
}
