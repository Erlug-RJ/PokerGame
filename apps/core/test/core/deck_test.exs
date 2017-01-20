defmodule DeckTest do
  use ExUnit.Case
  doctest Core.Deck
  alias Core.Deck

  test "total cards" do
    assert 52 == Enum.count Deck.generate_cards
  end

  test "unique cards" do
    count = Deck.generate_cards
        |> Enum.filter(fn card -> card == {2, :c} end)
        |> Enum.count
    assert count == 1
  end
end
