# craft4-ddev-vite-blueprint

Craft CMS 4 Webdevelopment Environment

## Requirements

-   Docker, https://www.docker.com
-   DDEV, https://ddev.com

## Setup

-   start ddev and get all important config infos

        ddev start
        ddev describe

-   open a bash session in the web container (or other container).

          ddev ssh

-   install Craft CMS 4 on local machine in web container

          composer install

-   install all packages in web container

          yarn install

-   Setup Craft CMS + install all Plugins in web container

        php craft setup
        sh craft-plugins.sh

-   exit web container and launch project

        exit
        ddev launch

-   manually remove the trailing '/' from PRIMARY_SITE_URL in .env
-   add this to .env
    ENVIRONMENT=dev

-   finaly run in web container

        yarn dev

## Vite
