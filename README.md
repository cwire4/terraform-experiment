A minimalist Terraform configuration to stand up an AWS Fargate cluster with a
containerized service inside that serves public web traffic.

---

# Status

## 1

- reading AWS credentials from environment variables.
- fargate-task.json copied from https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_AWSCLI_Fargate.html#AWSCLI_register_task_definition
- IAM roles copied from docs

### result

    $ terraform plan

    Error: aws_ecs_task_definition.main: ECS Task Definition container_definitions is invalid: Error decoding JSON: json: cannot unmarshal object into Go value of type []*ecs.ContainerDefinition

### next steps

- Create ECS Task Definition with AWS CLI or Web interface and export its JSON definition to ensure correct syntax
