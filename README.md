# craft4-ddev-vite-blueprint

Craft CMS 4 Webdevelopment Environment

## Requirements

-   Docker, https://www.docker.com
-   DDEV, https://ddev.com

## Setup

-   create ddev project environment

          ddev config

-   start ddev and get all important config infos

        ddev start
        ddev describe

-   open a bash session in the web container (or other container).

          ddev ssh

-   install Craft CMS 4 on local machine in web container

          composer install

-   install all packages in web container

          yarn install

-   Setup Craft CMS + install all Plugins in web container. Use credentials provided from ```ddev describe```

        php craft setup
        sh craft-plugins.sh

-   exit web container and launch project

        exit
        ddev launch

-   manually remove the trailing '/' from PRIMARY_SITE_URL in .env
-   add this to .env
    ENVIRONMENT=dev

-   finally run

        ddev yarn dev


## Vite
https://vitejs.dev

-   for development:

        ddev yarn dev

-   to create a static build:

        ddev yarn build

## Critical CSS

Critical CSS can be inlined to prevent [FUOC](https://en.wikipedia.org/wiki/Flash_of_unstyled_content)
add pages that should have inline styles in ```vite.config.js``` in the ```critical``` section. see [here](https://github.com/nystudio107/rollup-plugin-critical) for details.