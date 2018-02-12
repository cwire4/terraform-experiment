provider "aws" {
  version = "~> 1.9"
}

resource "aws_ecs_cluster" "main" {
  name = "main"
}

resource "aws_ecs_service" "main" {
  name = "main"
  task_definition = ""
  desired_count = 1
  launch_type = "FARGATE"
  cluster = "${aws_ecs_cluster.main.id}"
  task_definition = "${aws_ecs_task_definition.main.arn}"
  depends_on = ["aws_iam_role_policy.main"]
}

resource "aws_iam_role_policy" "main" {
  name = "main"
  role = "${aws_iam_role.main.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "main" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_ecs_task_definition" "main" {
  family = "main"
  container_definitions = "${file("fargate-task.json")}"
}

resource "aws_ecr_repository" "main" {
  name = "main"
}
