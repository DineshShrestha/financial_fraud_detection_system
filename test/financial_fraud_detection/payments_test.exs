defmodule FinancialFraudDetection.PaymentsTest do
  use FinancialFraudDetection.DataCase

  alias FinancialFraudDetection.Payments

  describe "transactions" do
    alias FinancialFraudDetection.Payments.Transaction

    import FinancialFraudDetection.PaymentsFixtures

    @invalid_attrs %{location: nil, amount: nil, transaction_time: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert Payments.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Payments.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{
        location: "some location",
        amount: "120.5",
        transaction_time: ~U[2026-05-03 20:48:00Z]
      }

      assert {:ok, %Transaction{} = transaction} = Payments.create_transaction(valid_attrs)
      assert transaction.location == "some location"
      assert transaction.amount == Decimal.new("120.5")
      assert transaction.transaction_time == ~U[2026-05-03 20:48:00Z]
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()

      update_attrs = %{
        location: "some updated location",
        amount: "456.7",
        transaction_time: ~U[2026-05-04 20:48:00Z]
      }

      assert {:ok, %Transaction{} = transaction} =
               Payments.update_transaction(transaction, update_attrs)

      assert transaction.location == "some updated location"
      assert transaction.amount == Decimal.new("456.7")
      assert transaction.transaction_time == ~U[2026-05-04 20:48:00Z]
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Payments.update_transaction(transaction, @invalid_attrs)

      assert transaction == Payments.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Payments.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Payments.change_transaction(transaction)
    end
  end
end
