# postgresql-czech-fulltext

Docker image with Czech language fulltext search support.

## Attribution

This work is heavily based on work done by Tomas Jelen on tjelen/postgres-tsearch-czech.
Original repository license is included as part of this repository license.

## Installation (with docker-compose)

```yaml
version: '3'
services:
  postgres:
    container_name: postgres-11.1-czech
    image: char0n/postgresql-czech-fulltext:11.1
    ports:
     - "5432:5432"
    environment:
      - POSTGRES_PASSWORD=my_secret_password
      - POSTGRES_DB=example_database
```

Save this `yaml` as `docker-compose.yml` and run it with
```bash
 $ docker-compose up
```

Note that Czech fulltext support will be now available in `example_database`. This is handled by the docker image itself.
When you manually create another database, then the Czech fulltext support will not be available automatically.
You have to run the following `SQL` commands inside your new database to enable it:

```sql
  create text search dictionary czech_spell
    (template=ispell, dictfile=czech, afffile=czech, stopwords=czech);
  create text search configuration czech (copy=english);
  alter text search configuration czech
    alter mapping for word, asciiword with czech_spell, simple;
```

## Postgresql supported versions

 - 11.1

## Author

 char0n (Vladimir Gorej)
  
 vladimir.gorej@gmail.com
 
 https://www.linkedin.com/in/vladimirgorej/

