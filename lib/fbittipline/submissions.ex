defmodule Fbittipline.Submissions do
  import Ecto.Query, warn: false
  alias Fbittipline.Repo
  alias Fbittipline.Submissions.Submission

  def list_submissions do
    Repo.all(Submission)
  end
end
