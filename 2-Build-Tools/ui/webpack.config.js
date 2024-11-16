const HtmlWebpackPlugins = require('html-webpack-plugin');
const CopyWebpackPlugins = require('copy-webpack-plugin');
const path = require('path');

module.exports = {
    mode: "development",
    entry: './src/index.js',
    output: {
        filename: 'app.js',
        path: path.resolve(__dirname, 'dist'),
    },
    plugins: [
        new HtmlWebpackPlugins({
            template: './src/index.html',
        }),
        new CopyWebpackPlugins({
            patterns: [{
                from: './src/style.css',
                to: 'css'
            }]
        })
    ]
};