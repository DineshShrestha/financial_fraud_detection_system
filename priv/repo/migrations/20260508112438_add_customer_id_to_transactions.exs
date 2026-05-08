defmodule FinancialFraudDetection.Repo.Migrations.AddCustomerIdToTransactions do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :customer_id, :integer
    end
  end
end
