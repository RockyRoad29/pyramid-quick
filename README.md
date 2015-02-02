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

Identify the exposed address and port:

    HELLO_SVR=`docker port $JOB1 8080`

Load the app in your default browser:

    xdg-open http://$HELLO_SVR/hello/$USER


This should bring up a web page showing a lovely greeting dedicated to you !

Stop the container

    docker stop $JOB1


Remove the container

    docker rm $JOB1

Human-friendly container name
-----------------------------
You may also use the human-friendly name for `JOB1` as shown in the last column by :

    $ docker ps -l
    CONTAINER ID        IMAGE                            COMMAND                CREATED             STATUS              PORTS                     NAMES
    4f8369887210        rockyroad/pyramid-quick:latest   "python ./helloworld   7 minutes ago       Up 7 minutes        0.0.0.0:49157->8080/tcp   sharp_heisenberg

This name can be set with the `--name=` option.

Setting the listening port on host
----------------------------------

The `-p`, or `--publish=[]` option to `docker run` allows to publish a container's port to the host.

format:

    ip:hostPort:containerPort | ip::containerPort | hostPort:containerPort | containerPort

(use 'docker port' to see the actual mapping)

Example:

    $ docker run -d --publish 127.0.0.2:8081:8080 --name hello_pyramid rockyroad/pyramid-quick
    dd0f4887da1be68e99204b1e277af04ca0e08841d5d3329aa08cf75f77c6886b

    $ docker ps -a
    CONTAINER ID        IMAGE                            COMMAND                CREATED             STATUS              PORTS                      NAMES
    dd0f4887da1b        rockyroad/pyramid-quick:latest   "python ./helloworld   6 seconds ago       Up 5 seconds        127.0.0.2:8081->8080/tcp   hello_pyramid

    $ docker port hello_pyramid
    8080/tcp -> 127.0.0.2:8081

Then you can provide a static link to your app: http://127.0.0.2:8081/hello/dear%20User

Interactive sessions
--------------------

Now, you may want to play around with the Pyramid framework or other aspects
of your virtual system.

Run the container interactively:

    docker run -it rockyroad/pyramid-quick  /bin/bash

This will bring up a root session in your container, where you can enter commands.

From your host computer, you can see the running apps logs, even after the container
is stopped.

    docker logs $JOB1

Sharing storage and network
---------------------------

In order to communicate with your host environment, you may want
to use a persistent storage volume, and expose more ports:

    docker run -v /tmp/pyramid-share:/home/share \
               -w /home/share \
               --expose=6543-6548 -P \
               -it rockyroad/pyramid-quick  /bin/bash


For example, you could scaffold a new pyramid app:

    pcreate --list
    pcreate --scaffold starter scaffold
    cd scaffold
    python setup.py develop
    pip freeze > env.pip
    pserve development.ini --reload

The app is served on http://0.0.0.0:6543 in the container.
Now check the published address on your host with `docker port`
and browse to it, for example: http://localhost:49160/

The whole transcript of the session will be available through
`docker logs ` .

License
-------
This software is distributed under [GPL v3 license](https://gnu.org/licenses/gpl.html), its documentation under
[Creative Commons Attribution-Nonconmmercial-Share Alike 3.0](http://creativecommons.org/licenses/by-sa/3.0/)

* [Pyramid](http://www.pylonsproject.org/about/license) is offered under a BSD-like license .
* [Python 3](https://docs.python.org/3/license.html) license is GPL-compatible
* [Docker](https://docs.docker.com/#licensing) is licensed under the Apache License, Version 2.0.

software contained in this image.
