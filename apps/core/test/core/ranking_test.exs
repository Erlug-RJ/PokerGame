defmodule Core.RankingTest do
  use ExUnit.Case
  use Quixir
  alias Core.Ranking

  test "this combination return 2 (Two Pair -> 10d, 10c, 6s, 6c, kd)" do
    hand = [{10, :diamonds}, {10, :clubs}, {6, :spades}, {6, :clubs}, {13, :diamonds}]
    assert Ranking.get_value(hand) == 2
  end

  test "this combination return 2 (Two Pair -> kd, 10d, 10c, 6s, 6c)" do
    hand = [{13, :diamonds}, {10, :diamonds}, {10, :clubs}, {6, :spades}, {6, :clubs}]
    assert Ranking.get_value(hand) == 2
  end

  test "this combination return 2 (Two Pair -> 10d, 10c, kd, 6s, 6c)" do
    hand = [{10, :diamonds}, {10, :clubs}, {13, :diamonds}, {6, :spades}, {6, :clubs}]
    assert Ranking.get_value(hand) == 2
  end

  test "this combination return 1 (Pair -> 8s, 6h, 2d, Ah, Ac)" do
    hand = [{8, :spades}, {6, :hearts}, {2, :diamonds}, {14, :hearts}, {14, :clubs}]   
    assert Ranking.get_value(hand) == 1
  end
  
  test "this combination return 1 (Pair -> 2s, 2h, 6d, 8h, Ac)" do
    hand = [{2, :spades}, {2, :hearts}, {6, :diamonds}, {8, :hearts}, {14, :clubs}]
    assert Ranking.get_value(hand) == 1
  end
  
  test "this combination return 1 (Pair -> 2s, 6h, 6d, 8h, Ac)" do
    hand = [{2, :spades}, {6, :hearts}, {6, :diamonds}, {8, :hearts}, {14, :clubs}]
    assert Ranking.get_value(hand) == 1
  end
  
  test "this combination return 1 (Pair -> 2s, 6h, 8d, 8h, Ac)" do
    hand = [{2, :spades}, {6, :hearts}, {8, :diamonds}, {8, :hearts}, {14, :clubs}]
    assert Ranking.get_value(hand) == 1
  end
  
  test "this combination return 0 (High Card -> )"  do
    hand = [{3, :diamonds}, {6, :hearts}, {10, :clubs}, {11, :spades}, {13, :hearts}]
    assert Ranking.get_value(hand) == 0
  end
end
