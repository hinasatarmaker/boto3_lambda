resource "aws_s3_bucket" "image_lambda_bucket" {
    bucket = "talab-lambda-bucket"
    
    tags = {
        Name = "lab-lambda-bucket"
        Environment = "Lab"
    }
}

resource "aws_s3_bucket_notification" "s3_bucket_notification" {
   bucket = aws_s3_bucket.image_lambda_bucket.id

   lambda_function {
     lambda_function_arn = aws_lambda_function.lambda_image_rekog.arn
     events              = ["s3:ObjectCreated:*"]
   }
}