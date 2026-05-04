defmodule FinancialFraudDetection.Payments.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :location, :string
    field :amount, :decimal
    field :transaction_time, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :transaction_time, :location])
    |> validate_required([:amount, :transaction_time, :location])
  end
end
