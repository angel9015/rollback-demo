defmodule TickTickBoom do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link(
      [
        worker(__MODULE__.Server, [__MODULE__.Router])
      ],
      strategy: :one_for_one,
      name: __MODULE__.Supervisor
    )
  end
end
