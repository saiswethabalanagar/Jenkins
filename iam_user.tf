resource "aws_iam_user" "example" {
  name = "example"
}

resource "aws_iam_user_policy_attachment" "example_attachment" {
  user       = aws_iam_user.example.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"  # Example policy, replace with your desired policy ARN
}

resource "aws_iam_group_membership" "add_user_to_group" {
  name  = aws_iam_group.new_group.name
  users = [aws_iam_user.example.name]
}
