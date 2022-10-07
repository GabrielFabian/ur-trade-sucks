resource "aws_lambda_function" "uts-fetch-players" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "zipMe.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.test"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("../build/zipMe.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

resource "aws_cloudwatch_log_group" "aws_cloudwatch_log_group" {
  name              = "/aws/lambda/lambda_function_name"
  retention_in_days = 14
}