#!/bin/bash

until pg_isready -U postgres -p 5432; do
  echo "Waiting for PostgreSQL to start..."
  sleep 1
done

echo "PostgreSQL is ready!"