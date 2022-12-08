<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\helpers\App;

$isDev = App::env('CRAFT_ENVIRONMENT') == 'dev';
$isProd = App::env('CRAFT_ENVIRONMENT') == 'production';

return [
    // Default Week Start Day (0 = Sunday, 1 = Monday...)
    'defaultWeekStartDay' => 1,

    // Whether generated URLs should omit "index.php"
    'omitScriptNameInUrls' => true,

    // Whether Dev Mode should be enabled (see https://craftcms.com/guides/what-dev-mode-does)
    'devMode' => $isDev,

    // Whether administrative changes should be allowed
    'allowAdminChanges' => $isDev,

    // Whether crawlers should be allowed to index pages and following links
    'disallowRobots' => !$isProd,

    // https://craftcms.com/docs/3.x/config/config-settings.html#limitautoslugstoascii
    'limitAutoSlugsToAscii' => true,

    // https://craftcms.com/docs/3.x/config/config-settings.html#convertfilenamestoascii
    'convertFilenamesToAscii' => true,

    // https://craftcms.com/docs/3.x/config/#aliases
    'aliases' => [
        '@web' => rtrim(App::env('PRIMARY_SITE_URL'), '/'),
        '@webroot' => dirname(__DIR__) . '/web',
    ]
    ,
    'sendPoweredByHeader' => false
];
