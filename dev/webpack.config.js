const path = require('path');

module.exports = {
  mode: 'development',
  context: path.resolve(__dirname),
  entry: './src/main.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  },
  devServer: {
  	contentBase: path.join(__dirname, 'dist'),
  	host: '0.0.0.0',
  	port: 8080
  }
};
