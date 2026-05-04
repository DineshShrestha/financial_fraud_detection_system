defmodule FinancialFraudDetection.FraudFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FinancialFraudDetection.Fraud` context.
  """

  @doc """
  Generate a fraud_alert.
  """
  def fraud_alert_fixture(attrs \\ %{}) do
    {:ok, fraud_alert} =
      attrs
      |> Enum.into(%{
        reason: "some reason",
        risk_level: "some risk_level",
        status: "some status"
      })
      |> FinancialFraudDetection.Fraud.create_fraud_alert()

    fraud_alert
  end
end
