defmodule Core.GameTest do
  use ExUnit.Case
  alias Core.{Game, Player}

  test "check start proccess" do
    assert {:ok, _pid} = Game.start_link
  end


  test "add player OK :D" do
    {:ok, pid} = Game.start_link
    player = %Player{name: "James ! = Thiago", hand: []}
    assert {:ok} = Game.add_player(pid, player)
  end

  describe "tests with one player" do
    setup do
      {:ok, pid} = Game.start_link
      player = %Player{name: "James ! = Thiago", hand: []}
      {:ok} = Game.add_player(pid, player)
      {:ok, %{pid: pid, player: player}}
    end

    test "get players", %{pid: pid, player: _player} do
      assert {:ok, players} = Game.get_players(pid)
      assert Enum.count(players) == 1
    end
  end

  describe "tests dealing cards" do
    setup do
      {:ok, pid} = Game.start_link
      pid
      |> Game.add_player(%Player{name: "James ! = Thiago", hand: []})
      |> Game.add_player(%Player{name: "Thiago ! = James", hand: []})
      {:ok, %{pid: pid}}
    end
    test "table should have three cards", %{pid: pid} do
      assert {:ok, table_cards } = Game.deal
    end
  end

end
