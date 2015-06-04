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
    #IO.inspect self()
    #Child.handle_cast(h, :pass, t)
    #GenServer.cast(h, {:pass, children})
    IO.puts "got here"
    #IO.inspect pid
    #IO.inspect Supervisor.which_children(pid)
    {:ok, pid} = supervise(children, strategy: :one_for_one)
    IO.inspect pid
    {:ok, pid}
  end
end
