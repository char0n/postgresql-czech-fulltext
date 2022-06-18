FROM postgres:14.3

MAINTAINER Vladimír Gorej <vladimir.gorej@gmail.com>

COPY ./czech.tar.gz /tmp

RUN tar xvzf /tmp/czech.tar.gz -C /tmp && mv /tmp/fulltext_dicts/czech.* /usr/share/postgresql/14/tsearch_data/ && rm -rf /tmp/czech.tar.gz && rm -rf /tmp/fulltext_dicts/

ADD ./add-tsearch-czech.sh docker-entrypoint-initdb.d/
