#!/bin/bash

set -e  

echo "🚀 Starting SQL migrations..."


# Load environment variables

if [ -f .env ]; then
  echo "📦 Loading environment variables..."
  export $(grep -v '^#' .env | xargs)
fi


# Check required variables

if [ -z "$DB_HOST" ] || [ -z "$DB_USER" ] || [ -z "$DB_NAME" ]; then
  echo "❌ Missing DB configuration!"
  echo "Please set DB_HOST, DB_USER, DB_NAME (and DB_PASSWORD if needed)"
  exit 1
fi


# Run SQL migrations

MIGRATIONS_DIR="./migrations"

if [ ! -d "$MIGRATIONS_DIR" ]; then
  echo "❌ Migrations folder not found!"
  exit 1
fi

echo "📂 Running migrations from $MIGRATIONS_DIR"

for file in $(ls $MIGRATIONS_DIR/*.sql | sort); do
  echo "🔄 Applying migration: $file"

  # MySQL Example
  mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < "$file"


done

echo "✅ All migrations applied successfully!"