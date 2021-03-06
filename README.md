# postgresql-czech-fulltext

Docker image with Czech language fulltext search support.

## Attribution

This work is heavily based on work done by [Tomas Jelen](https://github.com/tjelen) on [tjelen/postgres-tsearch-czech](https://github.com/tjelen/postgres-tsearch-czech).
Original repository license is included as part of this repository license.

## Dockerhub

[https://hub.docker.com/r/char0n/postgresql-czech-fulltext/](https://hub.docker.com/r/char0n/postgresql-czech-fulltext/)

## Installation (with docker-compose)

```yaml
version: '3'
services:
  postgres:
    container_name: postgres-11.12  -czech
    image: char0n/postgresql-czech-fulltext:11.12
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

## Verify installation

Connect to you postgresql database

```bash
 $ docker exec -it postgres-11.12-czech psql -U postgres -d example_database
```

```sql
 example_database=# \df
```

You should see the following output

```
               List of text search configurations
   Schema   |    Name    |              Description              
------------+------------+---------------------------------------
 pg_catalog | danish     | configuration for danish language
 pg_catalog | dutch      | configuration for dutch language
 pg_catalog | english    | configuration for english language
 pg_catalog | finnish    | configuration for finnish language
 pg_catalog | french     | configuration for french language
 pg_catalog | german     | configuration for german language
 pg_catalog | hungarian  | configuration for hungarian language
 pg_catalog | italian    | configuration for italian language
 pg_catalog | norwegian  | configuration for norwegian language
 pg_catalog | portuguese | configuration for portuguese language
 pg_catalog | romanian   | configuration for romanian language
 pg_catalog | russian    | configuration for russian language
 pg_catalog | simple     | simple configuration
 pg_catalog | spanish    | configuration for spanish language
 pg_catalog | swedish    | configuration for swedish language
 pg_catalog | turkish    | configuration for turkish language
 public     | czech      |
```

Additional Czech fulltext support verification:

```sql
 example_database# select to_tsvector('czech'::regconfig, 'test'); 
 
```

You should see the follwing output:

```sql
 to_tsvector 
-------------
 'test':1
(1 row)
```

## Postgresql supported versions

 - 11.1
 - 11.2
 - 11.3
 - 11.4
 - 11.5
 - 11.6
 - 11.7
 - 11.8
 - 11.9
 - 11.10
 - 11.11
 - 11.12

## Author

 char0n (Vladimir Gorej)
  
 vladimir.gorej@gmail.com
 
 https://www.linkedin.com/in/vladimirgorej/

