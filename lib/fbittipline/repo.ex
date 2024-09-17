defmodule Fbittipline.Repo do
  use Ecto.Repo,
    otp_app: :fbittipline,
    adapter: Ecto.Adapters.SQLite3
end
