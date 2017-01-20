defmodule Core.Deck do
  def generate_cards do
    all_cards = for x <- 2..14, y <- [:h, :c, :s, :d], do: {x, y}
    Enum.shuffle(all_cards)
  end
end
