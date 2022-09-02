<?php

use craft\helpers\App;

return [
    'useDevServer' => (bool) App::env('USE_VITE_DEV_SERVER'),
    'manifestPath' => Craft::getAlias('@webroot') . '/dist/manifest.json',
    'devServerPublic' => Craft::getAlias('@web') . ':3000',
    'serverPublic' => Craft::getAlias('@web') . '/dist/',
    'errorEntry' => 'src/js/app.ts',
    'cacheKeySuffix' => '',
    'devServerInternal' => '',
    'checkDevServer' => false,
    'includeReactRefreshShim' => false,
    'includeModulePreloadShim' => true,
    'criticalPath' => '@webroot/dist/criticalcss',
    'criticalSuffix' => '_critical.min.css',
];
