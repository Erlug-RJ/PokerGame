defmodule Core.RankingTest do
  use ExUnit.Case
  use Quixir
  alias Core.Ranking
  alias Core.Card


  test "this combination return 0 (High card -> 2d, 6h, 10c, Js, Kh)" do
    card1 = %Card{suit: :diamonds, rank: 2}
    card2 = %Card{suit: :hearts, rank: 6}
    card3 = %Card{suit: :clubs, rank: 10}
    card4 = %Card{suit: :spades, rank: 11}
    card5 = %Card{suit: :hearts, rank: 13}

    assert Ranking.get_value(card1, card2, card3, card4, card5) == 0
  end

  test "this combination return 1 (Pair -> 8s, 6h, 2d, Ah, Ac)" do
    card1 = %Card{suit: :spades, rank: 8}
    card2 = %Card{suit: :hearts, rank: 6}
    card3 = %Card{suit: :diamonds, rank: 2}
    card4 = %Card{suit: :hearts, rank: 14}
    card5 = %Card{suit: :clubs, rank: 14}

    assert Ranking.get_value(card1, card2, card3, card4, card5) == 1
  end
end
