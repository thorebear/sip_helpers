defmodule Tuple2 do
  @moduledoc """
  Functions for working with tuples of size 2. 
  """
  def map_first({fst, snd}, fun), do: {fun.(fst), snd}
  def map_second({fst, snd}, fun), do: {fst, fun.(snd)}
  def map_both({fst, snd}, fun), do: {fun.(fst), fun.(snd)}
  def first({fst, _snd}), do: fst
  def second({_fst, snd}), do: snd
end
