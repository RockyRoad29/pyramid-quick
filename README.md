A Docker image for Pyramid Web Framework
========================================

[Pyramid](http://docs.pylonsproject.org/projects/pyramid) is a small, fast, down-to-earth Python web framework.

[Docker](http://docker.com/) is an open platform for developers and sysadmins to build, ship, and run distributed applications.

The application
---------------

One of the simplest Pyramid applications you can make (HelloWorld)

Requirements
------------

* Docker
* git (optional)

You don't need to install `pyramid` nor even `python` : they will be built into
the Docker image.

How to use
----------

Clone this repository:

    git clone git@github.com:RockyRoad29/pyramid-quick.git
    cd pyramid-quick

Build the image:

    docker build -t rockyroad/pyramid-quick .

Run it as daemon

    docker run -dP rockyroad/pyramid-quick

or capture its ID in a variable

    JOB1=`docker run -dP rockyroad/pyramid-quick`

You may also use the human-friendly name for `JOB1` as shown in the last column by :

    $ docker ps -l
    CONTAINER ID        IMAGE                            COMMAND                CREATED             STATUS              PORTS                     NAMES
    4f8369887210        rockyroad/pyramid-quick:latest   "python ./helloworld   7 minutes ago       Up 7 minutes        0.0.0.0:49157->8080/tcp   sharp_heisenberg

Identify the exposed address and port:

    HELLO_SVR=`docker port $JOB1 8080`

Load the app in your default browser:

    xdg-open http://$HELLO_SVR/hello/$USER

Stop the container

    docker stop $JOB1


Remove the container

    docker rm $JOB1

License
-------
This software is distributed under [GPL v3 license](https://gnu.org/licenses/gpl.html), its documentation under
[Creative Commons Attribution-Nonconmmercial-Share Alike 3.0](http://creativecommons.org/licenses/by-sa/3.0/)

* [Pyramid](http://www.pylonsproject.org/about/license) is offered under a BSD-like license .
* [Python 3](https://docs.python.org/3/license.html) license is GPL-compatible
* [Docker](https://docs.docker.com/#licensing) is licensed under the Apache License, Version 2.0.

software contained in this image.
