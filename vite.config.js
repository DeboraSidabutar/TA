import {defineConfig} from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/app.css',
                'resources/js/app.js',
                'resources/tabler/dist/css/tabler.min.css',
                'resources/tabler/dist/css/tabler-flags.min.css',
                'resources/tabler/dist/css/tabler-payments.min.css',
                'resources/tabler/dist/css/tabler-vendors.min.css',
                'resources/tabler/dist/css/demo.min.css',
                'resources/tabler/dist/js/demo.min.js',
                'resources/tabler/dist/js/tabler.min.js',
                'resources/tabler/dist/js/demo-theme.min.js'
            ],
            refresh: true,
        }),
    ],
});
