Developer Documentation - Inception Infrastructure.
This document is intended for developers who want to set up, modify, or debug the infrastructure.

1. Environment Setup.
    -Prerequisites:
        -OS: Debian or any Linux distribution with Docker and docker-compose installed.
        -Local Domain: You must map the project domain to your local machine.
            sudo echo "127.0.0.1 ael-garr.42.fr" >> /etc/hosts.
    Configuration Files
    -The project structure is organized as follows:
        srcs/docker-compose.yml: The orchestration file.
        srcs/requirements/: Contains Dockerfiles and configurations for each service.
        srcs/.env: Contains secrets (must be created manually from a template).

2. Building and Launching.
The infrastructure is managed via a Makefile to ensure consistency.
    -Build & Launch: make.
    -Rebuild: make re (forces a full rebuild of the images).
    -Shutdown: make clean (stops containers).

3. Management Commands.
    -View Logs : docker logs <Contianer_name>
    -Enter Container : docker exec -it <Conainer_name> bash
    -Clean Volumes : make fclean (Warning: This deletes all site data).

4. Data Persistence and Storage.
This project uses Docker Named Volumes to ensure data persists even if containers are deleted.
    -Database Files: Stored in the /home/ael-garr/mariadb_data volume, mapped to /var/lib/mysql inside the MariaDB container.
    -Website Files: Stored in the /home/ael-garr/wordpress_data volume, mapped to /var/www/wordpress inside both the WordPress and NGINX containers.
