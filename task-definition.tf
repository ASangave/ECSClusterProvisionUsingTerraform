data "aws_ecs_task_definition" "wordpress" {
  task_definition = "${aws_ecs_task_definition.wordpress.family}"
}

resource "aws_ecs_task_definition" "wordpress" {
    family                = "hello_world"
    container_definitions = <<DEFINITION
[
  {
    "name": "wordpress",
    "image": <image URI which is pushed to AWS repository>,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 512,
    "cpu": 10
  }
]
DEFINITION
}
