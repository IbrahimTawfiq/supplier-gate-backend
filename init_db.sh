#!/usr/bin/env bash
set -e
: "${DB_DATABASE:=suppliergate}"
: "${DB_USERNAME:=sg_user}"
: "${DB_PASSWORD:=sg_pass}"

DB_EXISTS=$(mysql -N -s -uroot -e "SHOW DATABASES LIKE '${DB_DATABASE}';" || echo "")
if [[ -z "$DB_EXISTS" ]]; then
  mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`${DB_DATABASE}\`;"
  mysql -uroot -e "CREATE USER IF NOT EXISTS '${DB_USERNAME}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
  mysql -uroot -e "GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* TO '${DB_USERNAME}'@'%'; FLUSH PRIVILEGES;"
fi

# Import sample SQL if found and tables are empty
TABLES=$(mysql -N -s -u"${DB_USERNAME}" -p"${DB_PASSWORD}" "${DB_DATABASE}" -e "SHOW TABLES;" || true)
if [[ -z "$TABLES" ]]; then
  SQL_FILE=$(find /var/www/html -maxdepth 2 -name "*.sql" | head -n1)
  if [[ -n "$SQL_FILE" && -f "$SQL_FILE" ]]; then
    echo "Importing sample SQL: $SQL_FILE"
    mysql -u"${DB_USERNAME}" -p"${DB_PASSWORD}" "${DB_DATABASE}" < "$SQL_FILE" || true
  else
    echo "No SQL sample found to import."
  fi
fi
