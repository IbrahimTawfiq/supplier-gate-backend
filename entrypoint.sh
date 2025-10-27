#!/usr/bin/env bash
set -e

# Defaults
: "${APP_ENV:=production}"
: "${APP_DEBUG:=false}"
: "${APP_KEY:=}"
: "${DB_DATABASE:=suppliergate}"
: "${DB_USERNAME:=sg_user}"
: "${DB_PASSWORD:=sg_pass}"
: "${DB_HOST:=127.0.0.1}"
: "${DB_PORT:=3306}"
: "${BASIC_AUTH_USER:=}"
: "${BASIC_AUTH_PASS:=}"
: "${SERVER_PORT:=8080}"

# Apache listen on 8080 for Render
sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
sed -i 's/:80>/:8080>/' /etc/apache2/sites-available/000-default.conf

# Basic Auth (optional)
if [[ -n "$BASIC_AUTH_USER" && -n "$BASIC_AUTH_PASS" ]]; then
  apt-get update && apt-get install -y apache2-utils >/dev/null 2>&1 || true
  htpasswd -bc /etc/apache2/.htpasswd "$BASIC_AUTH_USER" "$BASIC_AUTH_PASS"
  cat >/etc/apache2/conf-available/basic-auth.conf <<'EOF'
<Location />
  AuthType Basic
  AuthName "Private"
  AuthUserFile /etc/apache2/.htpasswd
  Require valid-user
</Location>
EOF
  a2enconf basic-auth
fi

# Create .env from template
cat > .env <<EOF
APP_ENV=${APP_ENV}
APP_DEBUG=${APP_DEBUG}
APP_KEY=${APP_KEY}

APP_URL=https://${RENDER_EXTERNAL_URL}

DB_CONNECTION=mysql
DB_HOST=${DB_HOST}
DB_PORT=${DB_PORT}
DB_DATABASE=${DB_DATABASE}
DB_USERNAME=${DB_USERNAME}
DB_PASSWORD=${DB_PASSWORD}

CACHE_DRIVER=file
SESSION_DRIVER=file
QUEUE_DRIVER=sync
EOF

# Ensure permissions
chown -R www-data:www-data storage bootstrap/cache || true
chmod -R 775 storage bootstrap/cache || true

# Start MariaDB in background (supervisord will also manage it, but we need it for init)
/usr/sbin/mysqld --daemonize --pid-file=/var/run/mysqld/mysqld.pid
# Wait for DB ready
for i in {1..30}; do
  if mysqladmin ping --silent; then break; fi
  sleep 1
done

# Initialize DB and import sample SQL if provided
/init_db.sh || true

# Optimize Laravel cache (non-fatal if artisan not present)
php artisan config:clear || true
php artisan route:clear || true
php artisan cache:clear || true

# Generate app key if missing
if ! grep -q "APP_KEY=base64:" .env; then
  php artisan key:generate || true
fi

# Switch Apache docroot env
export APACHE_DOCUMENT_ROOT=/var/www/html/public

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
