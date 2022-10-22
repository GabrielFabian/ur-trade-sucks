const path = require('path');

module.exports = {
  entry: './src/index.ts',
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
    ],
  },
  resolve: {
    modules: ["node_modules"],
    extensions: ['.tsx', '.ts', '.js'],
  },
  target: "node",
  optimization: {
    minimize: false,
    nodeEnv: false,
  },
  externals: {
    "aws-sdk": "aws-sdk"
  },
  output: {
    filename: 'index.js',
    path: path.resolve(__dirname, 'build'),
    libraryTarget: 'umd'
  },
  mode: "production"
};