defmodule FinancialFraudDetection.Fraud.FraudEngine do
  alias FinancialFraudDetection.Fraud
  alias FinancialFraudDetection.Payments.Transaction

  def analyse_transaction(%Transaction{} = transaction) do
    rules = [
      check_odd_hour(transaction)
    ]

    triggered_rules =
      Enum.filter(rules, fn rule ->
        rule.triggered
      end)

    if triggered_rules != [] do
      create_alert(transaction, triggered_rules)
    else
      :ok
    end

    # if hour >= 0 and hour <= 5 do
    #   Fraud.create_fraud_alert(%{
    #     transaction_id: transaction.id,
    #     reason: "Odd hour transaction",
    #     risk_level: "medium",
    #     status: "open"
    #   })
    # else
    #   :ok
    # end
  end

  defp check_odd_hour(transaction) do
    hour = transaction.transaction_time.hour

    %{
      rule: "ODD_HOUR",
      triggered: hour >= 0 and hour <= 5,
      risk_level: "medium"
    }
  end

  defp create_alert(transaction, rules) do
    reason =
      rules
      |> Enum.map(& &1.rule)
      |> Enum.join(", ")

    Fraud.create_fraud_alert(%{
      transaction_id: transaction.id,
      reason: reason,
      risk_level: "medium",
      status: "open"
    })
  end
end
