defmodule WilsonScore do
  def compute(p, n, z) do
    part1 = p + z * z / (2 * n)
    part2 = z * :math.sqrt((p * (1 - p) + z * z / (4 * n)) / n)
    div = 1 + z * z / n
    lower = (part1 - part2) / div
    upper = (part1 + part2) / div

    {lower, upper}
  end

  @supported_conf [:C60, :C70, :C75, :C80, :C85, :C90, :C95, :C95, :C99]
  def z(conf) when conf in @supported_conf do
    case conf do
      :C60 -> 0.841
      :C70 -> 1.036
      :C75 -> 1.15
      :C80 -> 1.28
      :C85 -> 1.44
      :C90 -> 1.645
      :C95 -> 1.96
      :C99 -> 2.576
    end
  end

  def z(_),
    do: raise("Only #{Enum.join(@supported_conf, ", ")} is supported values for confidence")
end
