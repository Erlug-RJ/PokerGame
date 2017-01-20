defmodule Core.Game do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], [])
  end

  def add_player(pid, player) do
    GenServer.call(pid, {:add_player, player})
  end

  def get_players(pid) do
    GenServer.call(pid, {:get_players})
  end

  def init(_) do
    {:ok,
      %{
        players: [],
        deck: Core.Deck.generate_deck,
        table_cards: []
      }
    }
  end

  def handle_call({:add_player, player}, _from, state) do
    new_state = %{state | players: [player | state.players]}
    {:reply, {:ok}, new_state}
  end

  def handle_call({:get_players}, _from, state) do
    {:reply, {:ok, state.players}, state}
  end
end
