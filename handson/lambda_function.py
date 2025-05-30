import json


def lambda_handler(event, context):
    """
    Simple Hello World API handler for Lambda Function URL.
    
    Args:
        event: The event dict that contains the request data
        context: The context object that contains runtime information
        
    Returns:
        dict: API Gateway Lambda proxy response format
    """
    # Extract HTTP method from the event
    http_method = event.get('requestContext', {}).get('http', {}).get('method', 'GET')
    
    # Extract path from the event
    path = event.get('rawPath', '/')
    
    # Create response message
    message = {
        "message": "Hello World from Lambda!",
        "path": path,
        "method": http_method,
        "timestamp": context.aws_request_id
    }
    
    # Return response in API Gateway Lambda proxy format
    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json",
            "X-Request-ID": context.aws_request_id
        },
        "body": json.dumps(message)
    }