defmodule Core.RankingGuards do
    defmacro is_sequence(a, b, c, d, e) do
        quote do
            unquote(e) - 1 == unquote(d) and unquote(d) - 1 == unquote(c) and unquote(c) - 1 == unquote(b) and (unquote(b) - 1 == unquote(a) or unquote(a) == 14) 
        end
    end
end