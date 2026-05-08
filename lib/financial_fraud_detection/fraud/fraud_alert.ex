defmodule FinancialFraudDetection.Fraud.FraudAlert do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fraud_alerts" do
    field :reason, :string
    field :status, :string
    field :risk_level, :string
    field :transaction_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(fraud_alert, attrs) do
    fraud_alert
    |> cast(attrs, [:reason, :risk_level, :status, :transaction_id])
    |> validate_required([:reason, :risk_level, :status])
  end
end
