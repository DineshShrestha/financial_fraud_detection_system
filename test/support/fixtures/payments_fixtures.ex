defmodule FinancialFraudDetection.PaymentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FinancialFraudDetection.Payments` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        amount: "120.5",
        location: "some location",
        transaction_time: ~U[2026-05-03 20:48:00Z]
      })
      |> FinancialFraudDetection.Payments.create_transaction()

    transaction
  end
end
