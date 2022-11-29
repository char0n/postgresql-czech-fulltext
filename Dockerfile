FROM postgres:15beta1

MAINTAINER Vladimír Gorej <vladimir.gorej@gmail.com>

COPY ./fulltext-dicts/czech.* /usr/share/postgresql/15/tsearch_data/

ADD ./docker-entrypoint-initdb.d/1-add-tsearch-czech.sh /docker-entrypoint-initdb.d/
