🚀** Building a Real-World CI/CD Pipeline with GitHub Actions & AWS**

Author: Rasika Deshmukh
Focus: DevOps • Cloud • CI/CD Automation

🎯 Why This Project Exists

Most CI/CD tutorials show pipelines that work perfectly on the first run.
Real-world pipelines don’t.

This project was intentionally built to understand:

How GitHub Actions runners actually behave

How Terraform works with remote state

Why OIDC is replacing static cloud credentials

How IAM, CI, Docker, and Terraform fail in real life

How to debug and fix production CI pipelines

This is not a demo.
This is hands-on DevOps engineering.

🧠 What This Project Does

This project implements a production-grade Continuous Integration pipeline that:

Authenticates GitHub Actions to AWS using OIDC (no AWS keys 🔐)

Provisions Amazon ECR using Terraform (IaC)

Uses S3 + DynamoDB for Terraform remote state & locking

Builds a Docker image automatically

Pushes the image to Amazon ECR

Cleans up infrastructure safely using Terraform

Everything is automated.
Everything is reproducible.

🏗️ High-Level Architecture

📷 Add an architecture diagram image here
(Example: GitHub Actions → Terraform → ECR → Docker Push)

GitHub Actions (CI Runner)
        |
        |  OIDC (Assume IAM Role)
        |
   Terraform (IaC)
        |
   Amazon ECR
        |
   Docker Image

🧰 Tools Used (and Why)

GitHub Actions
Used as the CI engine to automate infrastructure and image builds.

Terraform
Used to provision AWS resources declaratively and manage lifecycle safely.

Docker
Used to package the application into an immutable container image.

Amazon ECR
Used as the container registry for storing and distributing Docker images.

Amazon S3 + DynamoDB
Used for Terraform remote state and state locking.

OIDC + IAM
Used to eliminate static AWS credentials and improve security.

📁 Project Structure

📷 Add a screenshot of your GitHub repo structure here

.github/workflows/
  terraform-ecr.yml      CI pipeline

terraform-ecr/
  main.tf                ECR resource
  provider.tf            AWS provider
  backend.tf             S3 + DynamoDB backend
  outputs.tf             ECR repository URL output

Dockerfile               Docker image definition
app.py                   Sample application

🔐 Security First – No Shortcuts

This project intentionally avoids:

❌ Hardcoded AWS credentials

❌ Long-lived access keys

❌ Manual infrastructure changes

Instead, it uses:

✅ OIDC-based authentication

✅ IAM role assumption

✅ Least-privilege permissions

✅ Infrastructure as Code

✅ Auditable CI execution

⚙️ CI Pipeline Flow

📷 Add a screenshot of a successful GitHub Actions run here

GitHub Actions checks out the source code

CI runner authenticates to AWS using OIDC

Terraform initializes remote backend

Terraform provisions Amazon ECR

Terraform outputs ECR repository URL

Docker builds the image

Docker pushes the image to Amazon ECR

🧪 How to Verify It Works

After the pipeline completes:

📷 Add an image of Amazon ECR → Images page

Docker image is visible in Amazon ECR

Image tag matches the pipeline run

Image can be pulled and run locally

Terraform state exists in S3

No manual AWS steps were required

🧹 Cleanup Matters (Professional Habit)

Infrastructure created by automation should be destroyed by automation.

This project includes a clean teardown process:

Delete Docker images from ECR

Destroy Terraform-managed resources

Release Terraform state locks

Leave no orphaned resources behind

🧠 What I Learned (The Hard Way)

Terraform fails immediately if run from the wrong directory

Remote backends require explicit S3 and DynamoDB permissions

CI runners reset shell context between steps

ECR repositories cannot be deleted if images exist

IAM errors in CI are subtle but critical

Debugging CI pipelines is a core DevOps skill

These are lessons real production systems teach, not tutorials.

🔮 What I Would Build Next

Add container vulnerability scanning

Implement Git-based image tagging

Deploy images to Kubernetes

Add dev → prod environments

Introduce approval gates

✨ Final Thought

This project is not about tools.

It’s about understanding how systems behave under automation,
how failures happen,
and how to fix them confidently.

That’s what real DevOps engineering looks like.
