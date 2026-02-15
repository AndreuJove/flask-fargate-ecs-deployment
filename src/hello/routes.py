from flask import Blueprint

hello_routes = Blueprint('hello_routes', __name__)

@hello_routes.route("/", methods=['GET'])
def index():
    return {
        "message": "Success",
        "status": "online"
    }, 200

@hello_routes.route("/hello", methods=['GET'])
def hello():
    return "Hello, World", 200

@hello_routes.route("/valentines", methods=['GET'])
def valentines():
    return {
        "message": "Happy Valentine's Day"
    }, 200

@hello_routes.route("/test", methods=['GET'])
def test():
    return {
        "message": "test version 3.0.0"
    }, 200

