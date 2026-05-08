defmodule FinancialFraudDetection.Payments.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :location, :string
    field :amount, :decimal
    field :transaction_time, :utc_datetime
    field :customer_id, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :transaction_time, :location, :customer_id])
    |> validate_required([:amount, :transaction_time, :location])
  end
end
