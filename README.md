This project has been created as part of the 42 curriculum by ael-garr.

Description:
The Inception project is a fundamental deep dive into system administration and infrastructure-as-code. The goal is to set up a small, fully functional infrastructure composed of multiple Docker containers, all coordinated via Docker Compose.
The infrastructure includes:
An NGINX server (serving as the only entry point via TLSv1.2/1.3).
A WordPress site (running with PHP-FPM).
A MariaDB database.
Persistent volumes for both the database and website files.
This project emphasizes the "building from scratch" philosophy: every service must have its own Dockerfile, and using pre-built images from Docker Hub (other than official Alpine/Debian base images) is strictly forbidden.

Project Description & Technical Choices:
This project utilizes Docker to containerize services, providing a lightweight and consistent environment across different machines. The source files are organized into a requirements/ directory, separating the configuration and setup scripts for each service to maintain high modularity.

Design Choices:
-Base Image: Using debian:bullseye for stability and a robust package manager.
-Security: Nginx is configured as a reverse proxy, ensuring that the WordPress and MariaDB containers are not directly exposed to the host network.
-Automation: A Makefile is used to orchestrate the build process, volume creation, and network setup.

Comparative Analysis:
Topic,Comparison:
-Virtual Machines vs Docker : VMs virtualize hardware and include a full Guest OS, making them heavy. Docker virtualizes the OS kernel, sharing the host kernel, which makes containers much faster and more lightweight.
-Secrets vs Env Variables : Environment Variables are easier to implement but can be visible in process logs. Docker Secrets are encrypted and only accessible to the specific service at runtime, making them far more secure for passwords.
Docker Network vs Host Network : The Host network removes isolation between the container and the host. A dedicated Docker Network (Bridge) provides an isolated ""private"" space where containers talk to each other by service name (e.g., wordpress or mariadb).
Docker Volumes vs Bind Mounts : Bind mounts depend on the host's folder structure. Docker Volumes are managed entirely by Docker, are more portable, and provide better performance on non-Linux hosts (like Mac/Windows).