defmodule FinancialFraudDetection.Repo do
  use Ecto.Repo,
    otp_app: :financial_fraud_detection,
    adapter: Ecto.Adapters.Postgres
end
