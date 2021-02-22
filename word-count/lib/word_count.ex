defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  @punctuation "!&@$%^&:,"

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split([" ", "_"])
    |> Enum.map(&strip_punctuation/1)
    |> Enum.reject(&is_empty/1)
    |> Enum.map(&String.downcase/1)
    |> calculate_frequencies()
  end

  #felt like Enum.frequencies was probably 'cheating' here
  defp calculate_frequencies(string_list) do
    string_list
    |> Enum.reduce(%{}, fn s, acc ->
      Map.update(acc, s, 1, fn existing -> existing + 1 end)
    end)
  end

  defp strip_punctuation(string) do
    string
    |> String.graphemes()
    |> Enum.reject(&is_punctuation/1)
    |> Enum.join()
  end

  defp is_punctuation(char) do
    String.contains?(@punctuation, char)
  end

  defp is_empty(s), do: s == ""
end
