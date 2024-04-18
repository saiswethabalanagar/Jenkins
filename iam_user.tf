resource "aws_iam_user" "example" {
  name = "example"
}

resource "aws_iam_user_policy_attachment" "example_attachment" {
  user       = aws_iam_user.example.name
  policy_arn = aws_iam_policy.example_policy1.arn
}
