# Pyramid-Quick - A Docker image for Pyramid Web Framework
# copyright (c) 2015 Michelle Baert
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
# -------------------------------------------------------------------------

FROM python:3-onbuild

# Base doc : https://registry.hub.docker.com/_/python/
# ----- The parent dockerfile is very simple:
# FROM python:3.3.6
# WORKDIR /usr/src/app
# ONBUILD COPY requirements.txt /usr/src/app/
# ONBUILD RUN pip install -r requirements.txt
# ONBUILD COPY . /usr/src/app
# -------------------------------------------

MAINTAINER RockyRoad
RUN echo Pyramid-Quick  Copyright (C) Michelle Baert \
    This program comes with ABSOLUTELY NO WARRANTY; \
    This is free software, and you are welcome to redistribute it \
    under certain conditions. \
    For details see LICENSE.
EXPOSE 8080
CMD [ "python", "./helloworld.py" ]
