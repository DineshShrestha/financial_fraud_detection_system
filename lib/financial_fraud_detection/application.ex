defmodule FinancialFraudDetection.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FinancialFraudDetectionWeb.Telemetry,
      FinancialFraudDetection.Repo,
      {DNSCluster,
       query: Application.get_env(:financial_fraud_detection, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FinancialFraudDetection.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FinancialFraudDetection.Finch},
      # Start a worker by calling: FinancialFraudDetection.Worker.start_link(arg)
      # {FinancialFraudDetection.Worker, arg},
      # Start to serve requests, typically the last entry
      FinancialFraudDetectionWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FinancialFraudDetection.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FinancialFraudDetectionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
