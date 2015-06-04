defmodule Child do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state)
  end

  def handle_cast(:pass, [h|t]) do
    Genserver.call(h, t ++ [self()])
    {:noreply, 'nomatter'}
  end
end
