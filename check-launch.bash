#! /bin/bash
HOST=$(awk '/HOST/ && f!=1 { print $2; f=1 } ' docker-compose.yml .env | sed 's/'\''/''/g' )
PASSWORD=$(awk '/PASSWORD/ && f!=1 { print $2; f=1 } ' docker-compose.yml .env | sed 's/'\''/''/g' )
while ! mysqladmin --host="$HOST" --user=root --password="$PASSWORD" ping; do echo 'mysqld is not ready yet..'; sleep 4; done;
npm run start;

