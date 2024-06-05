
resource "aws_iam_user" "test" {
  name = "test-user"

}
resource "aws_iam_group" "s3read" {
  name = "s3read"
}
resource "aws_iam_policy_attachment" "s3read" {
  name       = "s3read"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess" # Replace with your desired policy ARN
  groups     = [aws_iam_group.s3read.name]
}
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"


  users = [
    aws_iam_user.test.name,
    aws_iam_user.aslam.name,
  ]

  group = aws_iam_group.s3read.name
}




