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



  Lesson   Topic                                                Status

  -------- ---------------------------------------------------- -----------

  1        Bootcamp Introduction & Repository Setup             Completed

  2        First Terraform Configuration                        Completed

  3        Git Repository Initialized                           Completed

  4        Terraform Basics                                     Completed

  5        AWS VPC with Terraform                               Completed

  6        Public & Private Subnets                             Completed

  7        Internet Gateway & Public Routing                    Completed

  8        NAT Gateway & Private Routing                        Completed

  9        NAT Gateway Feature Flag                             Completed

  10       Preparation / Transition to EC2                      Completed

  11       EC2, Security Groups & Docker Setup                  Completed

  12       Docker Image Build                                   Completed

  13       Docker Image Versioning                              Completed

  14       Amazon ECR & IAM Integration                         Completed

  15       Amazon EKS Control Plane & Access                    Completed

  16       EKS Managed Node Group                               Completed

  17       Kubernetes Deployment, Service, Scaling & Rollouts   Completed

  18       Health Probes & Resource Management                  Completed

  19       ConfigMaps & Secrets                                 Completed

  20       Namespaces, ClusterIP & Kubernetes DNS               Completed



> Lesson 10 was part of the transition from networking to the EC2

> exercises and was not committed separately in Git. The EC2

> implementation itself was committed as Lesson 11.



------------------------------------------------------------------------



## Architecture



``` text

Internet

   |

Internet Gateway

   |

AWS VPC 10.0.0.0/16

   |

   +-- Public Subnet 1  10.0.1.0/24

   +-- Public Subnet 2  10.0.2.0/24

   |       |

   |       +-- NAT Gateway

   |

   +-- Private Subnet 1 10.0.11.0/24

   +-- Private Subnet 2 10.0.12.0/24

           |

           +-- Amazon EKS

               |

               +-- Managed Node Group

               +-- Kubernetes Deployments

               +-- Kubernetes Services

               +-- ConfigMaps

               +-- Secrets

               +-- Namespaces

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
+-- main.tf
+-- outputs.tf
+-- providers.tf
+-- terraform.tfvars
+-- variables.tf
+-- versions.tf

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

      |

Private Route Table

      |

NAT Gateway

      |

Internet Gateway

      |

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
|
+-- 01-terraform-basics/
|   +-- main.tf
|   +-- outputs.tf
|   +-- providers.tf
|   +-- variables.tf
|   +-- versions.tf
|
+-- 02-vpc/
|   +-- ec2.tf
|   +-- ecr.tf
|   +-- iam.tf
|   +-- internet-gateway.tf
|   +-- nat-gateway.tf
|   +-- route-tables.tf
|   +-- security-groups.tf
|   +-- subnets.tf
|   +-- vpc.tf
|
+-- 03-eks/
|   +-- access.tf
|   +-- configmap.yaml
|   +-- console-access.tf
|   +-- deployment.yaml
|   +-- eks.tf
|   +-- iam-eks.tf
|   +-- iam-nodes.tf
|   +-- nodes.tf
|   +-- secret.example.yaml
|   +-- service.yaml
|   +-- service-dev.yaml
|
+-- .gitignore
+-- README.md

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

# Helm Deployment and Release Management

The application deployment was migrated from manually managed Kubernetes
manifests to a reusable Helm chart.

The Helm chart is located in:

    04-helm/eks-bootcamp-web/

The chart manages:

- Kubernetes Deployment
- ClusterIP Service
- ConfigMap
- Replica count
- Container image repository and tag
- Resource requests and limits
- Readiness probes
- Liveness probes

The Kubernetes Secret remains managed separately and is excluded from Git.

## Helm Installation

The application was installed into the `dev` namespace:

    helm install eks-bootcamp-web . -n dev

The Helm release manages three application replicas using the container
image stored in Amazon ECR.

## Helm Upgrade

A new application image (`v4`) was built and pushed to Amazon ECR.

The Helm image tag was changed from:

    v3

to:

    v4

The release was upgraded with:

    helm upgrade eks-bootcamp-web . -n dev

The Kubernetes rolling update replaced the existing v3 Pods with v4 Pods
without recreating the EKS cluster.

## Helm Release History

Helm maintains release revisions:

    helm history eks-bootcamp-web -n dev

The bootcamp release history demonstrated:

    Revision 1 - Initial installation using v3
    Revision 2 - Upgrade to v4
    Revision 3 - Rollback to revision 1 (v3)

This demonstrated that a Helm rollback does not simply reactivate an old
revision. Helm creates a new revision representing the rollback.

## Helm Rollback

The application was rolled back with:

    helm rollback eks-bootcamp-web 1 -n dev

After the rollback:

- Helm revision 3 became the active release
- Kubernetes returned to image v3
- The application was verified through port-forwarding
- Local Helm values were returned to v3 to prevent configuration drift

## EKS Worker Node Cost Control

The EKS managed node group was updated so the worker node count can be
controlled through Terraform:

    variable "node_count"

The node group now uses:

    desired_size = var.node_count
    min_size     = var.node_count

This allows the worker capacity to be reduced when the bootcamp environment
is not being used:

    terraform apply -var="node_count=0"

and restored when work resumes:

    terraform apply -var="node_count=1"

The EKS control plane remains available while the worker node count is zero.

The NAT Gateway can also be temporarily removed through the existing
`create_nat_gateway` Terraform variable to reduce unnecessary AWS costs.

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

-   Helm

-   Helm charts and templating

-   Helm values

-   Helm upgrades

-   Helm release history

-   Helm rollbacks

-   Configuration drift awareness



------------------------------------------------------------------------



## Next Step

The next stage of the bootcamp introduces environment-specific Helm
configuration.

A single reusable Helm chart will be used with separate values for:

- Development
- Test
- Production

This will demonstrate how the same application templates can be deployed
consistently across multiple environments while keeping environment-specific
configuration separate.

After this, the bootcamp will continue toward CI/CD automation and
GitOps with Argo CD.
