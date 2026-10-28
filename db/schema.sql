CREATE TABLE accounts (
  id          SERIAL PRIMARY KEY,
  owner_name  TEXT NOT NULL,
  balance     NUMERIC(12, 2) NOT NULL DEFAULT 0 CHECK (balance >= 0),
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE transactions (
  id               SERIAL PRIMARY KEY,
  type             TEXT NOT NULL CHECK (type IN ('deposit', 'withdrawal', 'transfer')),
  amount           NUMERIC(12, 2) NOT NULL CHECK (amount > 0),
  from_account_id  INTEGER REFERENCES accounts(id),
  to_account_id    INTEGER REFERENCES accounts(id),
  created_at       TIMESTAMPTZ NOT NULL DEFAULT now()
);