defmodule Child do
  def start_link(state) do
    IO.puts "got to Child start_link"
    #send(self(), :init)
    self()
  end

  def handle_cast({:pass, [h|t]}, _) do
    {:noreply, 'nomatter'}
  end

  def init(state) do
    IO.puts "in Child init"
    IO.inspect state
    receive do
      {:hello, msg} -> send(self, :start_link)
    end
  end
end
