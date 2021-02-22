defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence)
    |> calculate_frequencies()
  end

  defp calculate_frequencies(string_list) do
    string_list
    |> Enum.reduce(%{}, fn (s, acc) ->
      Map.update(acc, s, 1, fn existing -> existing+1 end)
    end)
  end
end
