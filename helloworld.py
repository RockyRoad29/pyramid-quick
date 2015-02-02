from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response


def hello_world(request):
    return Response('Hello %(name)s!' % request.matchdict)

if __name__ == '__main__':
    # Configuration
    config = Configurator()
    config.add_route('hello', '/hello/{name}')
    config.add_view(hello_world, route_name='hello')

    # WSGI Application Creation
    app = config.make_wsgi_app()

    # WSGI Application Serving
    server = make_server('0.0.0.0', 8080, app)
    server.serve_forever()
