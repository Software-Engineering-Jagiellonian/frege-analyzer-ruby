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

## Deployment

### Build Image
```
docker build -t frege-analyzer-ruby .
```

### Run Image
```
docker run -e DB_HOST=172.17.0.3 -e DB_PORT=5432 -e DB_USERNAME=postgres -e DB_PASSWORD=haslo123 -e DB_DATABASE=frege -e RMQ_HOST=172.17.0.2 -e RMQ_PORT=5672 -v ./repositories:/repositories:ro frege-analyzer-ruby
```

## Authors
Paweł Kubiak (github.com/pkubiak)