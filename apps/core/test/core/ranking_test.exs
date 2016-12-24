defmodule Core.RankingTest do
  use ExUnit.Case
  use Quixir
  alias Core.Ranking

  test "this combination return 6 (Four of a Kind -> 8c, Ad, As, Ac, Ah)" do
    hand = [{8, :clubs}, {8, :diamonds}, {8, :spades}, {8, :clubs}, {14, :hearts}]
    assert Ranking.get_value(hand) == 6
  end

  test "this combination return 6 (Four of a Kind -> 8c, 8d, 8s, 8c, Ah)" do
    hand = [{8, :clubs}, {14, :diamonds}, {14, :spades}, {14, :clubs}, {14, :hearts}]
    assert Ranking.get_value(hand) == 6
  end

  test "this combination return 5 (Flush -> 3c, 4c, 6c, 8c, Qc)" do
    hand = [{3, :clubs}, {4, :clubs}, {6, :clubs}, {8, :clubs}, {12, :clubs}]
    assert Ranking.get_value(hand) == 5
  end

  test "this combination return 4 (Straight -> Ac, 2d, 3c, 4s, 5d)" do
    hand = [{2, :diamonds}, {3, :clubs}, {4, :spades}, {5, :diamonds}, {14, :clubs}]
    assert Ranking.get_value(hand) == 4
  end

  test "this combination return 4 (Straight -> 2d, 3c, 4s, 5d, 6c)" do
    hand = [{2, :diamonds}, {3, :clubs}, {4, :spades}, {5, :diamonds}, {6, :clubs}]
    assert Ranking.get_value(hand) == 4
  end

  test "this combination can not return 4 (Straight -> 2d, 3c, 4s, 5d, 6c)" do
    hand = [{2, :diamonds}, {2, :clubs}, {4, :spades}, {5, :diamonds}, {6, :clubs}]
    assert Ranking.get_value(hand) != 4
  end

  test "this combinatin return 3 (Three of a Kind -> 5c, 8d, Jc, Jh, Jd)" do
    hand = [{5, :clubs}, {8, :diamonds}, {11, :clubs}, {11, :hearts}, {11, :diamonds}]
    assert Ranking.get_value(hand) == 3
  end

  test "this combinatin return 3 (Three of a Kind -> Jc, Jh, Jd, 5c, 8d)" do
    hand = [{11, :clubs}, {11, :hearts}, {11, :diamonds}, {5, :clubs}, {8, :diamonds}]
    assert Ranking.get_value(hand) == 3
  end

  test "this combinatin return 3 (Three of a Kind -> 5c, Jc, Jh, Jd, 8d)" do
    hand = [{5, :clubs}, {11, :clubs}, {11, :hearts}, {11, :diamonds}, {8, :diamonds}]
    assert Ranking.get_value(hand) == 3
  end

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
