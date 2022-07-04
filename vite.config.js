import liveReload from "vite-plugin-live-reload";
import legacy from "@vitejs/plugin-legacy";
import critical from "rollup-plugin-critical";
import viteCompression from "vite-plugin-compression";

export default ({ command }) => ({
	base: command === "serve" ? "" : "/dist/",
	css: { preprocessorOptions: { scss: { charset: false } } },
	build: {
		manifest: true,
		outDir: "./web/dist/",
		rollupOptions: {
			input: {
				app: "./src/js/app.ts",
			},
		},
	},
	server: {
		host: '0.0.0.0',
		port: 3000
	},
	plugins: [
		liveReload("./templates/**/*"),
		legacy({
			targets: ["defaults"],
			additionalLegacyPolyfills: ["regenerator-runtime/runtime"],
		}),
		critical({
			criticalUrl: "http://localhost",
			criticalBase: "./web/dist/criticalcss/",
			criticalPages: [{ uri: "/", template: "index" }],
			criticalConfig: {},
		}),
		viteCompression(),
	],
});
