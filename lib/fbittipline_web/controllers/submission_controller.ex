defmodule FbittiplineWeb.SubmissionController do
  use FbittiplineWeb, :controller
  alias Fbittipline.Submissions.Submission
  alias Fbittipline.Repo
  require Logger

  def create(conn, params) do
    Logger.info("Received params: #{inspect(params)}")

    case params do
      %{"submission" => %{"title" => title, "body" => body}} ->
        # Process the submission with title and body
        case create_submission(%{title: title, body: body}) do
          {:ok, submission} ->
            conn
            |> put_status(:created)
            |> json(%{message: "Submission successfully processed", submission: submission})

          {:error, changeset} ->
            conn
            |> put_status(:unprocessable_entity)
            |> json(%{error: format_errors(changeset)})
        end

      _ ->
        # Handle case when submission, title, or body is missing
        conn
        |> put_status(:bad_request)
        |> json(%{error: "Missing required parameters. Please provide a submission with title and body."})
    end
  end

  defp create_submission(attrs) do
    %Submission{}
    |> Submission.changeset(attrs)
    |> Repo.insert()
  end

  defp format_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
