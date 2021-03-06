defmodule Covid19Web.Live.Components.DeathRecoveredChart do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div
      class="card"
      phx-hook="DeathRecoveredChart"
      data-statistics="<%= Jason.encode! @data %>"
    >
      <div class="card-content">
        <p class="title is-5 is-uppercase has-text-centered">Death vs Recovered Chart</p>
        <p class="subtitle is-6 is-uppercase has-text-centered has-text-monospace">
          <%= Enum.at(@data, 0).date |> fmt() %> -
          <%= Enum.at(@data, -1).date |> fmt() %>
        </p>
        <p phx-update="ignore">
          <div id="death-recovered-chart" style="height: 180px"></div>
        </p>
      </div>
    </div>
    """
  end

  defp fmt(%Date{} = date) do
    Timex.format!(date, "%b %d, %Y", :strftime)
  end
end
