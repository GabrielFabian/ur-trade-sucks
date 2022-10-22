resource "aws_lambda_function" "uts-fetch-players" {
  function_name = "uts-fetch-players"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.fooHandler"
  runtime = "nodejs16.x"

  s3_bucket = aws_s3_bucket.uts_fetch_players_lambda_bucket.id
  s3_key    = aws_s3_object.uts-fetch-players-lambda.key

  source_code_hash = data.archive_file.uts-fetch-players.output_base64sha256
}

resource "aws_cloudwatch_log_group" "aws_cloudwatch_log_group" {
  name              = "/aws/lambda/uts-fetch-players"
  retention_in_days = 14
}