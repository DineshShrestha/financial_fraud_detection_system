defmodule FinancialFraudDetection.FraudTest do
  use FinancialFraudDetection.DataCase

  alias FinancialFraudDetection.Fraud

  describe "fraud_alerts" do
    alias FinancialFraudDetection.Fraud.FraudAlert

    import FinancialFraudDetection.FraudFixtures

    @invalid_attrs %{reason: nil, status: nil, risk_level: nil}

    test "list_fraud_alerts/0 returns all fraud_alerts" do
      fraud_alert = fraud_alert_fixture()
      assert Fraud.list_fraud_alerts() == [fraud_alert]
    end

    test "get_fraud_alert!/1 returns the fraud_alert with given id" do
      fraud_alert = fraud_alert_fixture()
      assert Fraud.get_fraud_alert!(fraud_alert.id) == fraud_alert
    end

    test "create_fraud_alert/1 with valid data creates a fraud_alert" do
      valid_attrs = %{reason: "some reason", status: "some status", risk_level: "some risk_level"}

      assert {:ok, %FraudAlert{} = fraud_alert} = Fraud.create_fraud_alert(valid_attrs)
      assert fraud_alert.reason == "some reason"
      assert fraud_alert.status == "some status"
      assert fraud_alert.risk_level == "some risk_level"
    end

    test "create_fraud_alert/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fraud.create_fraud_alert(@invalid_attrs)
    end

    test "update_fraud_alert/2 with valid data updates the fraud_alert" do
      fraud_alert = fraud_alert_fixture()

      update_attrs = %{
        reason: "some updated reason",
        status: "some updated status",
        risk_level: "some updated risk_level"
      }

      assert {:ok, %FraudAlert{} = fraud_alert} =
               Fraud.update_fraud_alert(fraud_alert, update_attrs)

      assert fraud_alert.reason == "some updated reason"
      assert fraud_alert.status == "some updated status"
      assert fraud_alert.risk_level == "some updated risk_level"
    end

    test "update_fraud_alert/2 with invalid data returns error changeset" do
      fraud_alert = fraud_alert_fixture()
      assert {:error, %Ecto.Changeset{}} = Fraud.update_fraud_alert(fraud_alert, @invalid_attrs)
      assert fraud_alert == Fraud.get_fraud_alert!(fraud_alert.id)
    end

    test "delete_fraud_alert/1 deletes the fraud_alert" do
      fraud_alert = fraud_alert_fixture()
      assert {:ok, %FraudAlert{}} = Fraud.delete_fraud_alert(fraud_alert)
      assert_raise Ecto.NoResultsError, fn -> Fraud.get_fraud_alert!(fraud_alert.id) end
    end

    test "change_fraud_alert/1 returns a fraud_alert changeset" do
      fraud_alert = fraud_alert_fixture()
      assert %Ecto.Changeset{} = Fraud.change_fraud_alert(fraud_alert)
    end
  end
end
