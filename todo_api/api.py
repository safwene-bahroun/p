from flask import Flask
from flask_restful import Api, Resource

app = Flask(__name__)
api = Api(app)

# Define the resource classes
class HelloWorld(Resource):
    def get(self):
        return {'message': 'Hello World'}

class HelloSafwene(Resource):
    def get(self, name):
        return {'message': f'Hello {name}'}

# Add resources to the API
api.add_resource(HelloWorld, '/hello')
api.add_resource(HelloSafwene, '/helloworld/<string:name>')

if __name__ == '__main__':
    app.run(debug=True)