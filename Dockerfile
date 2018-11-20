FROM postgres:11.1

MAINTAINER Vladimír Gorej <vladimir.gorej@gmail.com>

COPY ./czech.tar.gz /tmp

RUN tar xvzf /tmp/czech.tar.gz -C /tmp && mv /tmp/fulltext_dicts/czech.* /usr/share/postgresql/11/tsearch_data/

ADD ./add-tsearch-czech.sh docker-entrypoint-initdb.d/
