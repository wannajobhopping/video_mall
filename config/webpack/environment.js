// 參考文章：https://dev.to/vannsl/vue3-on-rails-l9d
const { environment } = require('@rails/webpacker')
const { DefinePlugin } = require('webpack')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue');
const customConfig = require('./custom')
environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.plugins.prepend(
	'Define',
	new DefinePlugin({
		__VUE_OPTIONS_API__: false,
		// or __VUE_OPTIONS_API__: true,
		__VUE_PROD_DEVTOOLS__: false
	})
)
environment.loaders.prepend('vue', vue)
environment.config.merge(customConfig)
module.exports = environment
