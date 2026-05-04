defmodule FinancialFraudDetection.Fraud.FraudEngine do
  alias FinancialFraudDetection.Fraud
  alias FinancialFraudDetection.Payments.Transaction

  def analyse_transaction(%Transaction{} = transaction) do
    hour = transaction.transaction_time.hour

    if hour >= 0 and hour <= 5 do
      Fraud.create_fraud_alert(%{
        transaction_id: transaction.id,
        reason: "Odd hour transaction",
        risk_level: "medium",
        status: "open"
      })
    else
      :ok
    end
  end
end
