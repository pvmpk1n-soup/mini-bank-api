# mini-bank-api

A small banking REST API built with Python and FastAPI: accounts, deposits, withdrawals, and transfers that use database transactions so money is never lost or created by accident.

> **Work in progress.** This repo shows the project's development step by step, commit by commit.

## Tech stack

- Python 3.14, [FastAPI](https://fastapi.tiangolo.com/)
- [uv](https://docs.astral.sh/uv/) for dependencies and the virtual environment
- PostgreSQL with raw, parameterized SQL (planned)
- pytest (planned)

## Run it locally

Requires [uv](https://docs.astral.sh/uv/getting-started/installation/).

```bash
uv sync
uv run fastapi dev src/mini_bank_api/main.py
```

Then open:

- http://localhost:8000/health returns `{"status": "ok"}`
- http://localhost:8000/docs shows the interactive API docs

## Roadmap

- [x] Project setup and health check endpoint
- [ ] PostgreSQL schema: accounts and transactions (money stored as `NUMERIC`, balances can't go negative)
- [ ] Accounts API with input validation and tests
- [ ] Deposits, withdrawals and transfers inside a single database transaction (rollback on failure)
- [ ] Safe concurrent transfers (row locking) and transaction history with pagination
- [ ] Idempotency keys, so a retried request never moves money twice
- [ ] Currency conversion using a third-party exchange-rate API
- [ ] AWS: statement export to S3, DynamoDB, deployment on Lambda + API Gateway
- [ ] Linting and CI with GitHub Actions
