defmodule FinancialFraudDetection.Fraud do
  @moduledoc """
  The Fraud context.
  """

  import Ecto.Query, warn: false
  alias FinancialFraudDetection.Repo

  alias FinancialFraudDetection.Fraud.FraudAlert

  @doc """
  Returns the list of fraud_alerts.

  ## Examples

      iex> list_fraud_alerts()
      [%FraudAlert{}, ...]

  """
  def list_fraud_alerts do
    Repo.all(FraudAlert)
  end

  @doc """
  Gets a single fraud_alert.

  Raises `Ecto.NoResultsError` if the Fraud alert does not exist.

  ## Examples

      iex> get_fraud_alert!(123)
      %FraudAlert{}

      iex> get_fraud_alert!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fraud_alert!(id), do: Repo.get!(FraudAlert, id)

  @doc """
  Creates a fraud_alert.

  ## Examples

      iex> create_fraud_alert(%{field: value})
      {:ok, %FraudAlert{}}

      iex> create_fraud_alert(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fraud_alert(attrs \\ %{}) do
    %FraudAlert{}
    |> FraudAlert.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fraud_alert.

  ## Examples

      iex> update_fraud_alert(fraud_alert, %{field: new_value})
      {:ok, %FraudAlert{}}

      iex> update_fraud_alert(fraud_alert, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fraud_alert(%FraudAlert{} = fraud_alert, attrs) do
    fraud_alert
    |> FraudAlert.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fraud_alert.

  ## Examples

      iex> delete_fraud_alert(fraud_alert)
      {:ok, %FraudAlert{}}

      iex> delete_fraud_alert(fraud_alert)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fraud_alert(%FraudAlert{} = fraud_alert) do
    Repo.delete(fraud_alert)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fraud_alert changes.

  ## Examples

      iex> change_fraud_alert(fraud_alert)
      %Ecto.Changeset{data: %FraudAlert{}}

  """
  def change_fraud_alert(%FraudAlert{} = fraud_alert, attrs \\ %{}) do
    FraudAlert.changeset(fraud_alert, attrs)
  end
end
