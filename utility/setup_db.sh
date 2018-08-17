#!/usr/bin/env bash

docker exec -i --user postgres texaslanorg_db_1 createdb texaslan

docker exec -i --user postgres texaslanorg_db_1 psql texaslan -a  <<__END
create user texaslan_role password 'allilengyi';
__END

cat backup-texaslan_role.sql | docker exec -i texaslanorg_db_1 psql -Utexaslan_role texaslan -a

