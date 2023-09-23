resource "aws_iam_user" "lb" {
  name = "bob"
}


resource "aws_iam_user" "lb1" {
  name = "tim"
}

resource "aws_iam_user" "lb2" {
  name = "hello"
}

resource "aws_iam_group" "developers" {
  name = "developers"
}


resource "aws_iam_group" "developers1" {
  name = "devops"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb.name,
    aws_iam_user.lb1.name,
  ]

  group = aws_iam_group.developers.name
}


