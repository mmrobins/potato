defmodule Babysitter do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(Child, [{:ok, 'foo'}], [id: "child1"]),
      worker(Child, [{:ok, 'foo'}], [id: "child2"]),
      worker(Child, [{:ok, 'foo'}], [id: "child3"])
    ]

    [h|t] = children
    GenServer.cast(h, :pass, t)
    supervise(children, strategy: :one_for_one)
  end
end
