data "archive_file" "uts-fetch-players" {
  type = "zip"

  source_dir  = "${path.module}/../build"
  output_path = "${path.module}/../deploy/uts-fetch-players.zip"
}

resource "random_pet" "uts_fetch_players_lambda_bucket_name" {
  prefix = "uts-fetch-players"
  length = 4
}

resource "aws_s3_bucket" "uts_fetch_players_lambda_bucket" {
  bucket = random_pet.uts_fetch_players_lambda_bucket_name.id
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.uts_fetch_players_lambda_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "uts-fetch-players-lambda" {
  bucket = aws_s3_bucket.uts_fetch_players_lambda_bucket.id

  key    = "uts-fetch-players.zip"
  source = data.archive_file.uts-fetch-players.output_path

  etag = filemd5(data.archive_file.uts-fetch-players.output_path)
}