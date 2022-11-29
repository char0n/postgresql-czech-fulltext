FROM postgres:11.16

MAINTAINER Vladimír Gorej <vladimir.gorej@gmail.com>

COPY ./fulltext-dicts/czech.* /usr/share/postgresql/11/tsearch_data/

ADD ./docker-entrypoint-initdb.d/1-add-tsearch-czech.sh /docker-entrypoint-initdb.d/
