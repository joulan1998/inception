User Documentation - Inception Stack:
This document explains how to use and manage the web infrastructure provided by this project.

1. Services Provided.
The stack provides a complete, self-hosted WordPress environment:
-Web Server (NGINX): Acts as the secure gateway (HTTPS) for the website.
-Website (WordPress): The content management system where you can create and manage your blog or site.
-Database (MariaDB): Stores all website content, users, and settings securely.

2. Starting and Stopping the Project.
All management is done through the Makefile located in the project root.
-To Start: Run make . This builds the images and starts the services in the background.
-To Stop: Run make clean. This stops the services but keeps your data safe.

3. Accessing the Website.
Once the project is running:
-Main Website: Open your browser and go to https://ael-garr.42.fr.
-Administration Panel: Go to https://your_login.42.fr/wp-admin.
    Use the credentials defined in your .env file to log in.

4. Locating and Managing Credentials.
For security, all passwords and usernames are stored in a hidden file:
-File Location: srcs/.env
-Important: Never share this file. If you change a password in the .env file, you must run make re to apply the changes to the containers.

5. Checking Service Health
-To ensure everything is working correctly, run:
 ====> docker ps.
A healthy stack will show three containers with the status "Up". If a container says "Exited", there is an error in the configuration. 
