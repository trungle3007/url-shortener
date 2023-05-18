#!/bin/bash
bundle exec sequel -m db/migrations "${POSTGRES_URL}"
bundle exec puma config.ru