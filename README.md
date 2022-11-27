# Introduction 
This application serves as a baseline for a deployment pipeline development. It builds into a dynamic PHP application served via apache/nginx and demonstrated a working sleep timer.

# Getting Started

## Local build

The build was tested on ubuntu 18 bionic with php 7.2

- Clone the repo
- Install php7 (any minor should do, tested with 7.2)
- Install [Composer](https://getcomposer.org/download)
- Run `composer install` in the source folder
- Depending on the webserver chosen, install either Apache2 or NGINX with mod-php or php-fpm respectively. (For NGINX you can refer to the instructions [here](https://www.rosehosting.com/blog/how-to-install-php-7-4-with-nginx-on-ubuntu-20-04/)
- Configure the webserver to serve the site from localhost

## Containerized build

You can use containers to build and serve the application.
Run the composer install using `composer` pre-build container.
Run the application using any php webserver container (for example `php:7.2-apache-stretch`)

#ASSIGNMENT

TODO: 
- Write a multi-stage Dockerfile that builds and packages the application
- Set up an azure devops pipeline to push the container image to an Azure container registry (The registry is pre-configured)
- OPTIONAL - deploy the container or set up automated deployment using any means you choose so that a new successful build triggers a re-deploy. 
  The service should be available over the internet, open to the public, any way you want.

