pg_dump -h localhost -p 5432 -U postgres databasename >> db.sql
pg_dump -h localhost -p 5432 -U postgres postgres >> db.sql
cd root
pg_dump -h localhost -p 5432 -U postgres postgres >> db.sql
exit
