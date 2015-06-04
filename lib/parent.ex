defmodule Parent do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    babysitters = [
      worker(Babysitter, [[:hello]])
    ]

    supervise(babysitters, strategy: :one_for_one)
  end
end
