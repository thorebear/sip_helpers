defmodule EnumExtra do
  @moduledoc """
  Additional functions for Enumrables. 
  """
  def count_each(enumerable) do
    Enum.reduce(enumerable, %{}, fn k, acc -> Map.update(acc, k, 1, &(&1 + 1)) end)
  end

  def count_each_in_range(enumerable, min, max, range_size) do
    enumerable
    |> Enum.map(&(&1 - rem(&1, range_size)))
    |> count_each()
    |> Enum.filter(fn {k, v} -> k >= min and k <= max end)
    |> Enum.sort_by(fn {k, _} -> k end)
  end

  def average(enumerable) do
    Decimal.div(Decimal.new(Enum.sum(enumerable)), Decimal.new(Enum.count(enumerable)))
  end
end
