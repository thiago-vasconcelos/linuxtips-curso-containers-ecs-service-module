variable "region" {}

variable "service_name" {}

variable "container_image" {
  type        = string
  description = "Imagem com tag para deployment da aplicação no ECS"
}

variable "cluster_name" {}

variable "vpc_id" {}

variable "private_subnets" {}

variable "service_port" {}

variable "use_lb" {
  type        = bool
  default     = true
  description = "Habilita a exposição do serviço via Load Balancer"
}

variable "service_protocol" {
  type    = string
  default = null
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "service_connect_name" {
  type    = string
  default = null
}

variable "use_service_connect" {
  type    = bool
  default = false
}

variable "service_connect_arn" {
  type    = string
  default = null
}

variable "service_cpu" {}

variable "service_memory" {}

variable "service_listener" {
  default     = null
  type        = string
  description = "ARD do listener do Application Load Balancer que será utilizado pelo serviço"
}

variable "service_task_execution_role" {
  type        = string
  description = "ARN da role de execução de tarefas do ECS que o ser que será utiliz"
}

variable "service_launch_type" {
  type = list(object({
    capacity_provider = string
    weight            = number
  }))
  default = [{
    capacity_provider = "SPOT"
    weight            = 100
  }]
}

variable "service_task_count" {}

variable "service_hosts" {}

variable "service_healthcheck" {
  type = map(any)
}

variable "environment_variables" {
  type = list(object({
    name : string
    value : string
  }))
  default = []
}

variable "secrets" {
  type = list(object({
    name : string
    valueFrom : string
  }))
  default = []
}

variable "capabilities" {
  type    = list(any)
  default = []
}

variable "scale_type" {
  default = null
}

variable "task_minimum" {
  default = 3
}

variable "task_maximum" {
  default = 10
}

### Autoscaling de CPU

variable "scale_out_cpu_threshold" {
  default = 80
}

variable "scale_out_adjustment" {
  default = 1
}

variable "scale_out_comparison_operator" {
  default = "GreaterThanOrEqualToThreshold"
}

variable "scale_out_statistic" {
  default = "Average"
}

variable "scale_out_period" {
  default = 60
}

variable "scale_out_evaluation_periods" {
  default = 2
}

variable "scale_out_cooldown" {
  default = 60
}

variable "scale_in_cpu_threshold" {
  default = 30
}

variable "scale_in_adjustment" {
  default = -1
}

variable "scale_in_comparison_operator" {
  default = "LessThanOrEqualToThreshold"
}

variable "scale_in_statistic" {
  default = "Average"
}

variable "scale_in_period" {
  default = 120
}

variable "scale_in_evaluation_periods" {
  default = 3
}

variable "scale_in_cooldown" {
  default = 120
}

### Tracking CPU
variable "scale_tracking_cpu" {
  default = 80
}

### Tracking Requests
variable "alb_arn" {
  default = null
}

variable "scale_tracking_requests" {
  default = 0
}

variable "efs_volumes" {
  type = list(object({
    volume_name : string
    file_system_id : string
    file_system_root : string
    mount_point : string
    read_only : bool
  }))
  default = []
}

variable "service_discovery_namespace" {
  description = "Namespace id do Service Discovery"
  default     = null
}
