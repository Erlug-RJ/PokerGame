defmodule Core.Ranking do

  def get_value([]), do: 1

  def get_value([{a, _}, {a, _}, {_b, _}, {_c, _}, {_d, _}]), do: 1
  def get_value([{_a, _}, {b, _}, {b, _}, {_c, _}, {_d, _}]), do: 1
  def get_value([{_a, _}, {_b, _}, {c, _}, {c, _}, {_d, _}]), do: 1
  def get_value([{_a, _}, {_b, _}, {_c, _}, {d, _}, {d, _}]), do: 1

  def get_value([{_a, _}, {_b, _}, {_c, _}, {_d, _}, {_e, _}]), do: 0

end
