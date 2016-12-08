defmodule Core.Ranking do

  def get_value(card1, card2, card3, card4, card5) do
    card_list = [card1, card2, card3, card4, card5]
    couple =
      card_list
      |> Enum.group_by(fn card -> card.rank end)
      |> Map.values
      |> Enum.filter(fn count -> Enum.count(count) == 2 end)
      |> List.flatten

    IO.puts "================="
    IO.inspect(couple)
    IO.puts "================="

    if Enum.count(couple) == 2 do
      1
    else
      0
    end
  end

end
