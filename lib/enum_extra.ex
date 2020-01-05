defmodule EnumExtra do
  @moduledoc """
  Additional functions for Enumrables. 
  """
  def count_each(enumerable) do
    Enum.reduce(enumerable, %{}, fn k, acc -> Map.update(acc, k, 1, &(&1 + 1)) end)
  end

  def count_each_in_range(enumerable, min, max, range_size) do
    empty_result =
      step(min, max, range_size)
      |> Enum.map(fn k -> {k, 0} end)
      |> Enum.into(%{})

    enumerable
    |> Enum.map(&(rem(min, range_size) + &1 - rem(&1, range_size)))
    |> count_each()
    |> Enum.filter(fn {k, v} -> k >= min and k <= max end)
    |> Enum.into(%{})
    |> Map.merge(empty_result, fn _k, val1, _val2 -> val1 end)
    |> Enum.sort_by(fn {k, _} -> k end)
    |> Enum.map(fn {k, v} -> {{k, k + range_size}, v} end)
  end

  def step(min, max, step_size) do
    n = Integer.floor_div(max - min, step_size)

    Range.new(0, n)
    |> Enum.map(&(&1 * step_size + min))
  end

  def average(enumerable) do
    Decimal.div(Decimal.new(Enum.sum(enumerable)), Decimal.new(Enum.count(enumerable)))
  end

  def average_decimal(enumerable) do
    Decimal.div(Enum.reduce(enumerable, &Decimal.add/2), Decimal.new(Enum.count(enumerable)))
  end
end
