defmodule ConcurrentAcceptance.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers

      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import ConcurrentAcceptance.Router.Helpers

      alias ConcurrentAcceptance.Repo

      @endpoint ConcurrentAcceptance.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ConcurrentAcceptance.Repo)
    Hound.start_session
    Hound.Helpers.Navigation.navigate_to Phoenix.Ecto.SQL.Sandbox.path_for(ConcurrentAcceptance.Repo, self)
    :ok
  end
end
