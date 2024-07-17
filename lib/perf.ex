defmodule Perf do
  def setup do
    File.rm("/tmp/lmdb1")
    {:ok, env} = :elmdb.env_open(~c"/tmp/lmdb1", [])
    {:ok, dbi} = :elmdb.db_open(env, [:create])
    dbi
  end

  def run do
    dbi = setup()

    :ok = :elmdb.put(dbi, "a", "1")
    row_count = 10_000
    row_size = 100
    row = String.duplicate("a", row_size)

    time(fn ->
      1..row_count
      |> Enum.each(fn i -> :elmdb.put(dbi, "#{i}", row) end)
    end)
    |> IO.inspect()
  end

  def time(fun) do
    {time, _}= :timer.tc(fun)
    time / 1_000_000
  end
end
