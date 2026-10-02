# AWS EKS Bootcamp



Hands-on AWS, Terraform, Docker, Amazon ECR, Amazon EKS and Kubernetes

bootcamp.



The goal of this project is to build an AWS container platform step by

step, starting with Terraform fundamentals and AWS networking and

progressing towards a working Amazon EKS environment running

containerized workloads.



The environment is built primarily as Infrastructure as Code and is

intentionally created and destroyed during the bootcamp to gain

practical experience with deployment, troubleshooting and cloud cost

management.



------------------------------------------------------------------------



## Bootcamp Progress



&#x20; Lesson   Topic                                                Status

&#x20; -------- ---------------------------------------------------- -----------

&#x20; 1        Bootcamp Introduction & Repository Setup             Completed

&#x20; 2        First Terraform Configuration                        Completed

&#x20; 3        Git Repository Initialized                           Completed

&#x20; 4        Terraform Basics                                     Completed

&#x20; 5        AWS VPC with Terraform                               Completed

&#x20; 6        Public & Private Subnets                             Completed

&#x20; 7        Internet Gateway & Public Routing                    Completed

&#x20; 8        NAT Gateway & Private Routing                        Completed

&#x20; 9        NAT Gateway Feature Flag                             Completed

&#x20; 10       Preparation / Transition to EC2                      Completed

&#x20; 11       EC2, Security Groups & Docker Setup                  Completed

&#x20; 12       Docker Image Build                                   Completed

&#x20; 13       Docker Image Versioning                              Completed

&#x20; 14       Amazon ECR & IAM Integration                         Completed

&#x20; 15       Amazon EKS Control Plane & Access                    Completed

&#x20; 16       EKS Managed Node Group                               Completed

&#x20; 17       Kubernetes Deployment, Service, Scaling & Rollouts   Completed

&#x20; 18       Health Probes & Resource Management                  Completed

&#x20; 19       ConfigMaps & Secrets                                 Completed

&#x20; 20       Namespaces, ClusterIP & Kubernetes DNS               Completed



> Lesson 10 was part of the transition from networking to the EC2

> exercises and was not committed separately in Git. The EC2

> implementation itself was committed as Lesson 11.



------------------------------------------------------------------------



## Architecture



``` text

Internet

&#x20;  |

Internet Gateway

&#x20;  |

AWS VPC 10.0.0.0/16

&#x20;  |

&#x20;  +-- Public Subnet 1  10.0.1.0/24

&#x20;  +-- Public Subnet 2  10.0.2.0/24

&#x20;  |       |

&#x20;  |       +-- NAT Gateway

&#x20;  |

&#x20;  +-- Private Subnet 1 10.0.11.0/24

&#x20;  +-- Private Subnet 2 10.0.12.0/24

&#x20;          |

&#x20;          +-- Amazon EKS

&#x20;              |

&#x20;              +-- Managed Node Group

&#x20;              +-- Kubernetes Deployments

&#x20;              +-- Kubernetes Services

&#x20;              +-- ConfigMaps

&#x20;              +-- Secrets

&#x20;              +-- Namespaces

```



Application container images are built with Docker, stored in Amazon ECR

and deployed to Amazon EKS.



------------------------------------------------------------------------



# Lessons



## Lesson 1 - Bootcamp Introduction & Repository Setup



Started the EKS bootcamp project and created the initial project

structure.



### Topics



-   AWS and EKS bootcamp objectives

-   Local project structure

-   Infrastructure as Code concepts

-   Preparation for Terraform and Git



------------------------------------------------------------------------



## Lesson 2 - First Terraform Configuration



Created the first Terraform configuration and started working with

Terraform locally.



### Topics



-   Terraform configuration files

-   `terraform init`

-   `terraform plan`

-   `terraform apply`

-   Terraform state



------------------------------------------------------------------------



## Lesson 3 - Git Repository Initialized



Placed the bootcamp project under Git version control.



### Topics



-   Git repository initialization

-   `.gitignore`

-   Git commits

-   Tracking Terraform configuration

-   Preparing the repository for GitHub



------------------------------------------------------------------------



## Lesson 4 - Terraform Basics



Expanded the Terraform configuration into a reusable structure.



### Topics



-   Providers

-   Variables

-   Terraform variable files

-   Outputs

-   Terraform versions

-   Resource configuration



Files include:



``` text

01-terraform-basics/

Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ main.tf

Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ outputs.tf

Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ providers.tf

Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ terraform.tfvars

Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ variables.tf

Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ versions.tf

```



------------------------------------------------------------------------



## Lesson 5 - Create AWS VPC with Terraform



Started building the AWS infrastructure.



### Topics



-   AWS provider

-   VPC creation

-   CIDR addressing

-   Terraform variables

-   Terraform outputs



Main VPC:



``` text

10.0.0.0/16

```



------------------------------------------------------------------------



## Lesson 6 - Public and Private Subnets



Expanded the VPC into a multi-subnet architecture.



### Network



``` text

Public subnet 1   10.0.1.0/24

Public subnet 2   10.0.2.0/24



Private subnet 1  10.0.11.0/24

Private subnet 2  10.0.12.0/24

```



### Topics



-   Public subnets

-   Private subnets

-   CIDR planning

-   Availability-zone aware networking



------------------------------------------------------------------------



## Lesson 7 - Internet Gateway and Public Routing



Added internet connectivity to the public network.



### Topics



-   Internet Gateway

-   Public route table

-   Default route

-   Route table associations



Example route:



``` text

0.0.0.0/0 -> Internet Gateway

```



------------------------------------------------------------------------



## Lesson 8 - NAT Gateway and Private Routing



Added outbound internet connectivity for resources in private subnets.



### Topics



-   NAT Gateway

-   Elastic IP

-   Private route table

-   Public versus private routing

-   Outbound connectivity from private subnets



``` text

Private Subnet

&#x20;     |

Private Route Table

&#x20;     |

NAT Gateway

&#x20;     |

Internet Gateway

&#x20;     |

Internet

```



------------------------------------------------------------------------



## Lesson 9 - NAT Gateway Feature Flag



Made NAT Gateway creation configurable in Terraform.



### Topics



-   Terraform boolean variables

-   Conditional resources

-   `count`

-   Cost-aware infrastructure

-   Enabling and disabling NAT infrastructure



Example concept:



``` hcl

create_nat_gateway = true

```



This became particularly useful because NAT Gateways generate costs

while running.



------------------------------------------------------------------------



## Lesson 10 - Preparation / Transition to EC2



This lesson was not committed separately in Git. It represents the

transition from the networking exercises towards running compute

workloads inside the VPC.



The EC2 implementation itself was committed as Lesson 11.



------------------------------------------------------------------------



## Lesson 11 - EC2, Security Groups and Docker Setup



Added an EC2 instance to the bootcamp environment.



### Topics



-   Amazon Linux 2023

-   EC2

-   `t3.micro`

-   Security Groups

-   SSH

-   AWS key pairs

-   Public IP addressing

-   Docker preparation



Terraform resources included:



``` text

aws_instance

aws_key_pair

aws_security_group

```



The private SSH key is excluded from Git.



------------------------------------------------------------------------



## Lesson 12 - Docker Image Build



Created the bootcamp web application as a Docker image.



### Topics



-   Dockerfile

-   Web application container

-   Building Docker images

-   Running containers

-   Container testing



------------------------------------------------------------------------



## Lesson 13 - Docker Image Versioning



Used multiple versions of the application image during deployment

exercises.



``` text

v1

v2

v3

```



This later allowed Kubernetes rolling-update and rollback exercises.



------------------------------------------------------------------------



## Lesson 14 - Amazon ECR and IAM Integration



Added Amazon Elastic Container Registry to the platform.



### Topics



-   Amazon ECR

-   Docker authentication

-   Image repositories

-   Docker push

-   IAM permissions

-   EC2/ECR integration

-   Image scanning

-   Mutable image tags



The ECR repository is configured with:



``` hcl

force_delete = true

```



This allows Terraform to clean up the repository during lab teardown

even when images are still present.



------------------------------------------------------------------------



## Lesson 15 - Amazon EKS Control Plane and Access



Created the Amazon EKS cluster.



### Topics



-   Amazon EKS

-   Kubernetes control plane

-   EKS IAM cluster role

-   Private subnets

-   Kubernetes 1.35

-   EKS authentication

-   Access entries

-   Console access

-   `API_AND_CONFIG_MAP`

-   `kubectl`



------------------------------------------------------------------------



## Lesson 16 - EKS Managed Node Group



Added compute capacity to the EKS cluster.



### Topics



-   EKS Managed Node Groups

-   EC2 worker nodes

-   Node IAM role

-   `AmazonEKSWorkerNodePolicy`

-   `AmazonEKS_CNI_Policy`

-   `AmazonEC2ContainerRegistryPullOnly`

-   NAT Gateway connectivity

-   Node troubleshooting



Worker configuration included:



``` text

Instance type: t3.small

Desired nodes: 1

Minimum nodes: 1

Maximum nodes: 2

```



Verification:



``` bash

kubectl get nodes

```



------------------------------------------------------------------------



## Lesson 17 - Kubernetes Deployment, Service, Scaling and Rollouts



Deployed the application to Kubernetes.



### Topics



-   `deployment.yaml`

-   Pods

-   ReplicaSets

-   Deployments

-   Kubernetes Services

-   AWS Load Balancer

-   Scaling

-   Desired state

-   Self-healing

-   Rolling updates

-   Rollbacks

-   Rollout history



The application was scaled to three replicas. Self-healing was tested by

deleting a Pod and observing Kubernetes automatically create a

replacement.



Useful commands:



``` bash

kubectl get pods

kubectl get deployments

kubectl scale deployment

kubectl rollout status deployment/eks-bootcamp-web

kubectl rollout history deployment/eks-bootcamp-web

kubectl rollout undo deployment/eks-bootcamp-web

```



------------------------------------------------------------------------



## Lesson 18 - Health Probes and Resource Management



Added application health checks and resource controls.



### Health Probes



Configured:



-   Liveness probe

-   Readiness probe



Both probes used HTTP GET `/`.



### Resource Requests and Limits



Configured CPU and memory requests and limits. An intentionally

oversized memory request was also tested, producing:



``` text

FailedScheduling

Insufficient memory

```



This demonstrated how the Kubernetes scheduler uses resource requests

when placing Pods on nodes.



------------------------------------------------------------------------



## Lesson 19 - ConfigMaps and Secrets



Separated application configuration from the Deployment.



### ConfigMap



Environment variables included:



``` text

APP_ENV=production

WELCOME_MESSAGE=Welkom bij de EKS Bootcamp

```



The variables were verified inside a running container with

`kubectl exec`.



### Kubernetes Secret



Created:



``` text

eks-bootcamp-secret

```



The real local Secret file is excluded from Git:



``` text

secret.yaml

```



A safe template is stored instead:



``` text

secret.example.yaml

```



This lesson also demonstrated that base64 encoding is not encryption.



------------------------------------------------------------------------



## Lesson 20 - Kubernetes Namespaces and DNS



Created a separate development namespace:



``` text

dev

```



The same application name was deployed in both the `default` and `dev`

namespaces.



### Namespace-scoped Resources



The development namespace used its own Deployment, Pods, ConfigMap,

Secret and Service.



### ClusterIP



The development Service uses `ClusterIP` instead of creating another

public AWS Load Balancer.



### Kubernetes DNS



Cross-namespace communication was tested using:



``` text

eks-bootcamp-web.default.svc.cluster.local

```



The request successfully returned the application page with:



``` text

Welkom bij versie 3!

```



This demonstrated that namespaces provide logical resource and naming

isolation but do not automatically provide network isolation.

NetworkPolicies would be required for stronger network-level isolation.



------------------------------------------------------------------------



# Repository Structure



``` text

eks-bootcamp/

Ã¢â€â€š

Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ 01-terraform-basics/

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ main.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ outputs.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ providers.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ variables.tf

Ã¢â€â€š   Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ versions.tf

Ã¢â€â€š

Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ 02-vpc/

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ ec2.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ ecr.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ iam.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ internet-gateway.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ nat-gateway.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ route-tables.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ security-groups.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ subnets.tf

Ã¢â€â€š   Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ vpc.tf

Ã¢â€â€š

Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ 03-eks/

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ access.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ configmap.yaml

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ console-access.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ deployment.yaml

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ eks.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ iam-eks.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ iam-nodes.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ nodes.tf

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ secret.example.yaml

Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ service.yaml

Ã¢â€â€š   Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ service-dev.yaml

Ã¢â€â€š

Ã¢â€Å“Ã¢â€â‚¬Ã¢â€â‚¬ .gitignore

Ã¢â€â€Ã¢â€â‚¬Ã¢â€â‚¬ README.md

```



------------------------------------------------------------------------



# Terraform Workflow



Typical workflow:



``` bash

terraform init

terraform validate

terraform plan

terraform apply

```



To remove the lab environment:



``` bash

terraform plan -destroy

terraform destroy

```



------------------------------------------------------------------------



# Troubleshooting Experience



During the bootcamp several real-world issues were investigated and

resolved, including:



-   EKS node creation failures

-   NAT Gateway connectivity

-   Kubernetes scheduling failures

-   Insufficient memory

-   YAML indentation and tab errors

-   Readiness and liveness probe behaviour

-   Failed Deployment rollouts

-   Pod replacement and self-healing

-   Rollback testing

-   EKS access configuration

-   Namespace-scoped ConfigMaps and Secrets

-   Kubernetes DNS and cross-namespace communication

-   ECR repository cleanup



------------------------------------------------------------------------



# Cost Management and Teardown



AWS resources used during this bootcamp can generate costs. Particular

attention was paid to:



-   Amazon EKS control plane

-   EC2 worker nodes

-   EC2 instances

-   NAT Gateway

-   Elastic IP addresses

-   AWS Load Balancers

-   EBS volumes

-   Amazon ECR



At the end of the lab environment, Terraform was used to destroy the EKS

and VPC infrastructure.



The cleanup was then verified using the AWS CLI for:



-   EC2 instances

-   EKS clusters

-   NAT Gateways

-   Load Balancers

-   Elastic IP addresses

-   EBS volumes

-   EBS snapshots

-   CloudWatch log groups



This is an important part of the bootcamp: infrastructure lifecycle

management includes both provisioning and controlled teardown.



------------------------------------------------------------------------



# Skills Demonstrated



-   AWS networking

-   Terraform

-   Infrastructure as Code

-   VPC design

-   Public and private networking

-   NAT Gateway

-   EC2

-   IAM

-   Docker

-   Amazon ECR

-   Amazon EKS

-   Kubernetes

-   Deployments

-   ReplicaSets

-   Services

-   Load Balancers

-   Scaling and self-healing

-   Rolling updates and rollbacks

-   Health probes

-   Resource requests and limits

-   ConfigMaps

-   Secrets

-   Namespaces

-   Kubernetes DNS

-   Troubleshooting

-   Cloud cost management

-   Git and GitHub



------------------------------------------------------------------------



## Next Step



The next stage of the bootcamp will continue with Kubernetes and EKS

operational topics, including observability and troubleshooting.
