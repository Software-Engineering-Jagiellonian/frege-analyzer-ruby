# frege-analyzer-ruby

Frege analyzer for ruby source code.

## Environment variables
Following environment variables are used to connect to database and message queue.

### PostgreSQL
- DB_HOST
- DB_PORT
- DB_USERNAME
- DB_PASSWORD
- DB_DATABASE

### RabbitMQ
- RMQ_HOST
- RMQ_PORT

## Reported metrics

Collected metrics are stored in `ruby_metrics` table:
```sql
CREATE TABLE ruby_metrics (
    repo_id text PRIMARY KEY,
    metrics json NOT NULL
)
```

### Collected metrics

#### RubyCritic
TBA

#### Flog
TBA

#### Cycromatic
TBA

## Authors
Paweł Kubiak (github.com/pkubiak)