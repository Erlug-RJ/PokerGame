defmodule Core.Ranking do
  import Core.RankingGuards, only: [is_sequence: 5]

  def get_value([{10, s}, {11, s}, {12, s}, {13, s}, {14, s}]), do: 9

  def get_value([{a,s}, {b,s}, {c,s}, {d,s}, {e,s}]) when is_sequence(a, b, c, d, e), do: 8

  def get_value([{_a, _}, {b, _}, {b, _}, {b, _}, {b, _}]), do: 7
  def get_value([{a, _}, {a, _}, {a, _}, {a, _}, {_b, _}]), do: 7

  def get_value([{a, _}, {a, _}, {b, _}, {b, _}, {b, _}]), do: 6
  def get_value([{a, _}, {a, _}, {a, _}, {b, _}, {b, _}]), do: 6 

  def get_value([{_,s}, {_,s}, {_,s}, {_,s}, {_,s}]), do: 5

  def get_value([{a, _}, {b, _}, {c, _}, {d, _}, {e, _}]) when is_sequence(a, b, c, d, e), do: 4

  def get_value([{_a, _}, {_b, _}, {c, _}, {c, _}, {c,_}]), do: 3
  def get_value([{a, _}, {a, _}, {a, _}, {_b, _}, {_c, _}]), do: 3
  def get_value([{_a, _}, {b, _}, {b, _}, {b, _}, {_c, _}]), do: 3

  def get_value([{a, _}, {a, _}, {b, _}, {b, _}, {_c, _}]), do: 2
  def get_value([{_a, _}, {b, _}, {b, _}, {c, _}, {c, _}]), do: 2
  def get_value([{a, _}, {a, _}, {_b, _}, {c, _}, {c, _}]), do: 2
  
  def get_value([{a, _}, {a, _}, {_b, _}, {_c, _}, {_d, _}]), do: 1
  def get_value([{_a, _}, {b, _}, {b, _}, {_c, _}, {_d, _}]), do: 1
  def get_value([{_a, _}, {_b, _}, {c, _}, {c, _}, {_d, _}]), do: 1
  def get_value([{_a, _}, {_b, _}, {_c, _}, {d, _}, {d, _}]), do: 1

  def get_value([{_a, _}, {_b, _}, {_c, _}, {_d, _}, {_e, _}]), do: 0

end
