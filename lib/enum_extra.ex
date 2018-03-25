defmodule EnumExtra do
  @moduledoc """
  Additional functions for Enumrables. 
  """
  def count_each(enumerable) do
    Enum.reduce(enumerable, %{}, fn k, acc -> Map.update(acc, k, 1, &(&1 + 1)) end)
  end

  def average(enumerable) do
    Decimal.div(Decimal.new(Enum.sum(enumerable)), Decimal.new(Enum.count(enumerable)))
  end
end
