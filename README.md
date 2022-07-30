# craft4-ddev-vite-blueprint

Craft CMS 4 Webdevelopment Environment

## Requirements

-   Docker, https://www.docker.com
-   DDEV, https://ddev.com

## Installing Craft

To install craft CMS run

        make install

Follow the prompts.

This command will:

1.  Start your DDEV project
3.  Install Composer
4.  Install node packages
5.  Do a one-time build of Vite
6.  Generate APP_ID and save to your .env file
7.  Generate SECURITY_KEY and save to your .env file
8.  Installing Craft for the first time, allowing you to set the admin's account credentials
9.  Install all Craft plugins

Once the process is complete, type ddev launch to open the project in your default browser.

## Vite

### Start Dev Server

        make dev

### Make build

        make build
