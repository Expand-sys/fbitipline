defmodule FbittiplineWeb.PageController do
  use FbittiplineWeb, :controller
  alias Fbittipline.Submissions
  alias Fbittipline.Submissions.Submission

  def home(conn, _params) do
    render(conn, :home)
  end

  def tips(conn, _params) do
    submissions = Submissions.list_submissions()
    render(conn, :tips, submissions: submissions)
  end
end
